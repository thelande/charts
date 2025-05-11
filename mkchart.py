#!/usr/bin/env python3
"""
Generate a new helm chart using templates.
"""

import logging
import os
import shutil
import subprocess
import typer
import yaml
from enum import Enum
from jinja2 import Environment, FileSystemLoader, select_autoescape
from pathlib import Path
from pydantic import BaseModel, ConfigDict, Field, model_validator, ValidationError
from rich.console import Console
from rich.logging import RichHandler
from typing_extensions import Annotated, Any, Self

app = typer.Typer(context_settings={"help_option_names": ["-h", "--help"]})
log = logging.getLogger()


def setup_logging():
    """
    Set up the logging handlers.
    """
    logging.basicConfig(
        level=logging.INFO,
        format="%(message)s",
        handlers=[RichHandler(console=Console(stderr=True), show_path=False)],
    )


class NamedBlock(BaseModel):
    name: str
    values_section_name: str | None = None  # Defaults to `name` in model_post_init

    def model_post_init(self, context: Any) -> None:
        super().model_post_init(context)
        if not self.values_section_name:
            self.values_section_name = self.name


class SubchartDefinition(NamedBlock):
    repository: str
    version: str


class ImageBlock(BaseModel):
    registry: str | None = None
    repository: str
    tag: str


class ComponentType(str, Enum):
    DEPLOYMENT = "deployment"
    STATEFULSET = "statefulset"


class BasePortBlock(NamedBlock):
    port: int
    protocol: str = "TCP"


class EnvBlock(NamedBlock):
    value: str


class ComponentBlock(NamedBlock):
    model_config = ConfigDict(arbitrary_types_allowed=True)

    image: ImageBlock
    type: ComponentType
    ports: list[BasePortBlock]
    env: Annotated[list[EnvBlock], Field(default_factory=list)]
    persistence: bool | None = None

    @model_validator(mode="after")
    def check_persistence(self) -> Self:
        """Only StatefulSets can use the persistence flag."""
        if self.type != ComponentType.STATEFULSET and self.persistence is not None:
            raise ValidationError("persistence cannot be set for non-statefulsets")
        return self


class ServicePortBlock(BasePortBlock):
    target_port: int | None = None
    node_port: int | None = None


class ServiceBlock(NamedBlock):
    component: str | None = None  # Defaults to the service's `name` in model_post_init
    ports: list[ServicePortBlock]

    def model_post_init(self, context: Any) -> None:
        super().model_post_init(context)
        if not self.component:
            self.component = self.name


class IngressBlock(NamedBlock):
    service: str | None = None  # Defaults to the ingress' `name` in model_post_init
    service_port_name: str = "http"

    def model_post_init(self, context: Any) -> None:
        super().model_post_init(context)
        if not self.service:
            self.service = self.name


class PersistenceBlock(NamedBlock):
    mount_path: str
    component: str | None = None  # Defaults to the PVC's `name` in model_post_init

    def model_post_init(self, context: Any) -> None:
        super().model_post_init(context)
        if not self.component:
            self.component = self.name


class ChartDefinition(BaseModel):
    model_config = ConfigDict(arbitrary_types_allowed=True)

    # Mandatory fields
    chart_name: str
    app_version: str
    description: str

    components: list[ComponentBlock]

    # Optional fields
    category: str | None = None
    app_source: str | None = None
    homepage: str | None = None
    icon: str | None = None
    keywords: Annotated[list[str], Field(default_factory=list)]
    subcharts: Annotated[list[SubchartDefinition], Field(default_factory=list)]
    disabled_templates: Annotated[list[str], Field(default_factory=list)]

    services: Annotated[list[ServiceBlock], Field(default_factory=list)]
    ingresses: Annotated[list[IngressBlock], Field(default_factory=list)]
    persistence: Annotated[list[PersistenceBlock], Field(default_factory=list)]

    @classmethod
    def from_file(cls, config_file: typer.FileText):
        """
        Create a new ChartDefinition from a configuration file.

        :param typer.FileText config_file: The configuration from which the
            object should be created.
        """
        return cls(**yaml.safe_load(config_file))

    def create_chart_directory(self, overwrite: bool):
        """
        Create the chart directory.

        Overwrites any existing directory if *overwrite* is `True`, otherwise
        throws a `FileExistsError`.

        :param bool overwrite: Overwrite existing directory, when `True`.
        """
        if not overwrite and self.chart_root_dir.exists():
            log.error(f"Chart directory exists: {self.chart_root_dir}")
            raise FileExistsError(self.chart_root_dir)
        elif not self.chart_root_dir.exists():
            self.chart_root_dir.mkdir()
            self.chart_templates_dir.mkdir()

    def render_templates(self, template_dir: Path):
        """
        Render the templates into the new chart directory.

        :param Path template_dir: The path of the template directory.
        """
        env = Environment(
            loader=FileSystemLoader(template_dir),
            autoescape=select_autoescape(),
        )

        # Render/copy the chart basic files.
        log.info("Rendering chart basic files")
        self._render_template("Chart.yaml.j2", Path("Chart.yaml"), env)
        self._render_template("values/main.yaml.j2", Path("values.yaml"), env)
        shutil.copy(template_dir / ".helmignore", self.chart_root_dir / ".helmignore")

        # Special environment for handling helm template files since they use
        # the same variable syntax as Jinja.
        helm_tmpl_env = Environment(
            variable_start_string="[[",
            variable_end_string="]]",
            loader=FileSystemLoader(template_dir / "templates"),
            autoescape=select_autoescape(),
        )

        self._render_template(
            "_helpers.tpl.j2", Path("templates/_helpers.tpl"), helm_tmpl_env
        )

        self._render_template(
            "service-account.yaml.j2",
            Path("templates/service-account.yaml"),
            helm_tmpl_env,
        )

        self._render_components(helm_tmpl_env)
        self._render_services(helm_tmpl_env)
        self._render_ingresses(helm_tmpl_env)
        self._render_pvcs(helm_tmpl_env)

    def _render_services(self, env: Environment):
        """Render the service helm templates."""
        component_names = self.get_component_names()
        for service in self.services:
            # Verify the service matches a component.
            if service.component not in component_names:
                raise ValueError(
                    f"Service is not associated with a known component: {service.name}"
                )

            log.info(f"Rendering Service: {service.name}")
            service_filename = f"{service.name}-service.yaml"
            context = {"chart": self, "service": service}
            self._render_template(
                "service.yaml.j2", Path("templates") / service_filename, env, context
            )

    def _render_ingresses(self, env: Environment):
        """Render the ingress helm templates."""
        service_names = self.get_service_names()
        for ingress in self.ingresses:
            # Verify the ingress matches a service.
            if ingress.service not in service_names:
                raise ValueError(
                    f"Ingress is not associated with a known Service: {ingress.name}"
                )

            log.info(f"Rendering Ingress: {ingress.name}")
            ingress_filename = f"{ingress.name}-ingress.yaml"
            context = {"chart": self, "ingress": ingress}
            self._render_template(
                "ingress.yaml.j2", Path("templates") / ingress_filename, env, context
            )

    def _render_pvcs(self, env: Environment):
        """Render the PersistentVolumeClaim helm templates."""
        component_names = self.get_component_names()
        for pvc in self.persistence:
            # Verify the PVC matches a component.
            if pvc.component not in component_names:
                raise ValueError(
                    f"PVC is not associated with a known component: {pvc.name}"
                )
            
            # Do not render the PVC if it belongs to a StatefulSet.
            component = self.get_component_by_name(pvc.component)
            if component.type != ComponentType.STATEFULSET:
                log.info(f"Rendering PVC: {pvc.name}")
                pvc_filename = f"{pvc.name}-pvc.yaml"
                context = {"chart": self, "pvc": pvc}
                self._render_template(
                    "pvc.yaml.j2", Path("templates") / pvc_filename, env, context
                )
            else:
                log.info(f"Skipping PVC that belongs to StatefulSet: {pvc.name}")

    def _render_components(self, env: Environment):
        """Render the deployment and statefulset helm templates."""
        self._render_deployments(env)
        self._render_statefulsets(env)

    def _render_statefulsets(self, env: Environment):
        """Render the statefulset helm templates."""
        statefulsets = [
            c for c in self.components if c.type == ComponentType.STATEFULSET
        ]
        for sts in statefulsets:
            log.info(f"Rendering StatefulSet: {sts.name}")
            deployment_filename = f"{sts.name}-statefulset.yaml"
            pvcs = self.get_pvcs_for_component(sts.name)
            context = {"chart": self, "component": sts, "pvcs": pvcs}
            self._render_template(
                "statefulset.yaml.j2",
                Path("templates") / deployment_filename,
                env,
                context,
            )

    def _render_deployments(self, env: Environment):
        """Render the deployment helm templates."""
        deployments = [c for c in self.components if c.type == ComponentType.DEPLOYMENT]
        for deployment in deployments:
            log.info(f"Rendering Deployment: {deployment.name}")
            deployment_filename = f"{deployment.name}-deployment.yaml"
            pvcs = self.get_pvcs_for_component(deployment.name)
            context = {"chart": self, "component": deployment, "pvcs": pvcs}
            self._render_template(
                "deployment.yaml.j2",
                Path("templates") / deployment_filename,
                env,
                context,
            )

    def _render_template(
        self,
        template: str,
        dest: Path,
        env: Environment,
        context: BaseModel | dict[str, Any] | None = None,
    ):
        """
        Render a single template.

        :param str template: The path of the template file.
        :param Environment env: The jinja environment to use for rendering.
        """
        if not context:
            context = self
        if not isinstance(context, dict):
            context = context.model_dump()

        tmpl = env.get_template(template)
        abs_dest = self.chart_root_dir / dest
        log.debug(f"Rendering {tmpl.filename} to {abs_dest} ...")
        with abs_dest.open("w") as fp:
            fp.write(tmpl.render(context))
            fp.write("\n")

    def get_component_names(self) -> list[str]:
        """
        Returns the list of component names.
        """
        return [c.name for c in self.components]
    
    def get_component_by_name(self, name: str) -> ComponentBlock:
        """
        Returns the named component, or raises a `ValueError` if no component
        exists with the given name.

        :param str name: The name of the component to return.
        :raises: ValueError
        :rtype: ComponentBlock
        """
        for component in self.components:
            if component.name == name:
                return component
        raise ValueError(f"No component exists with name: {name}")
    
    def get_pvcs_for_component(self, name: str) -> list[PersistenceBlock]:
        """
        Returns a list of persistent blocks for the named component.

        :param str name: The name of the component for which the blocks should be returned.
        :rtype: list[PersistenceBlock]
        """
        pvcs = []
        for pvc in self.persistence:
            if pvc.component == name:
                pvcs.append(pvc)
        return pvcs

    def get_service_names(self) -> list[str]:
        """
        Returns the list of service names.
        """
        return [s.name for s in self.services]

    @property
    def chart_root_dir(self) -> Path:
        """
        Returns the root directory of the new chart.
        """
        return Path("charts") / self.chart_name

    @property
    def chart_templates_dir(self) -> Path:
        """
        Returns the templates directory of the new chart.
        """
        return self.chart_root_dir / "templates"


@app.command()
def main(
    config_file: Annotated[
        typer.FileText,
        typer.Argument(
            metavar="PATH", help="The configuration containing the chart details."
        ),
    ],
    overwrite: Annotated[
        bool,
        typer.Option(
            "-o",
            "--overwrite/--no-overwrite",
            is_flag=True,
            help="Overwrite existing chart directory when set.",
        ),
    ] = False,
    readme: Annotated[
        bool,
        typer.Option(
            "-r",
            "--readme/--no-readme",
            is_flag=True,
            help="Use helm-docs to generate the README.md.",
        ),
    ] = True,
    template_dir: Annotated[
        Path,
        typer.Option(
            "-t",
            "--template",
            metavar="PATH",
            help="The path to the template directory.",
        ),
    ] = Path("template"),
):
    """Generate a new helm chart from a template directory."""
    chart_def = ChartDefinition.from_file(config_file)
    try:
        chart_def.create_chart_directory(overwrite)
    except FileExistsError:
        raise typer.Exit(1)

    chart_def.render_templates(template_dir)

    # Run helm-docs to render the README.md
    if readme:
        helmdocs = shutil.which("helm-docs")
        if not helmdocs:
            log.warning("Did not find helm-docs. Will not render README.md")
        else:
            log.info("Running helm-docs to generate README.md")
            with open(os.devnull) as null:
                subprocess.run(
                    [helmdocs],
                    cwd=chart_def.chart_root_dir,
                    stdout=null,
                    stderr=null,
                    check=True,
                )


if __name__ == "__main__":
    setup_logging()
    app()
