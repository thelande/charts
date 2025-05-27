# prusa-exporter

![Version: 0.1.0](https://img.shields.io/badge/Version-0.1.0-informational?style=flat-square) ![AppVersion: 2.0.0-alpha2](https://img.shields.io/badge/AppVersion-2.0.0--alpha2-informational?style=flat-square)

Prometheus exporter for Prusa3D printers - supports Prusa Link API and Syslog metrics as well as logs from printer.

**Homepage:** <https://prusa3d.com/>

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| Tom Helander |  | <https://github.com/thelande/charts> |

## Source Code

* <https://github.com/thelande/charts/tree/main/charts/prusa-exporter>
* <https://github.com/pstrobl96/prusa_exporter>

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| oci://registry-1.docker.io/bitnamicharts | common | 2.x.x |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| apiVersions | list | `[]` | Override Kubernetes API versions reported by .Capabilities |
| clusterDomain | string | `"cluster.local"` | Kubernetes cluster domain name |
| commonAnnotations | object | `{}` | Annotations to add to all deployed objects |
| commonLabels | object | `{}` | Labels to add to all deployed objects |
| diagnosticMode.args | list | `["infinity"]` | Args to override all containers in the chart release |
| diagnosticMode.command | list | `["sleep"]` | Command to override all containers in the chart release |
| diagnosticMode.enabled | bool | `false` | Enable diagnostic mode (all probes will be disabled and the command will be overridden) |
| fullnameOverride | string | `""` | String to fully override common.names.fullname |
| global.defaultStorageClass | string | `""` | Global default StorageClass for Persistent Volume(s) |
| global.imagePullSecrets | list | `[]` | Global Docker registry secret names as an array |
| global.imageRegistry | string | `""` | Global Docker image registry |
| global.security.allowInsecureImages | bool | `false` | Allows skipping image verification |
| kubeVersion | string | `""` | Override Kubernetes version |
| metrics.enabled | bool | `false` |  |
| metrics.serviceMonitors.prusaExporter.annotations | object | `{}` |  |
| metrics.serviceMonitors.prusaExporter.enabled | bool | `false` | If `true`, creates a Prometheus Operator ServiceMonitor (also requires `metrics.enabled` to be `true`) |
| metrics.serviceMonitors.prusaExporter.honorLabels | bool | `false` | honorLabels chooses the metric's labels on collisions with target labels |
| metrics.serviceMonitors.prusaExporter.interval | string | `""` | Interval at which metrics should be scraped. ref: https://github.com/coreos/prometheus-operator/blob/master/Documentation/api.md#endpoint |
| metrics.serviceMonitors.prusaExporter.jobLabel | string | `""` | The name of the label on the target service to use as the job name in Prometheus |
| metrics.serviceMonitors.prusaExporter.labels | object | `{}` | Extra labels for the ServiceMonitor |
| metrics.serviceMonitors.prusaExporter.metricRelabelings | list | `[]` | Specify additional relabeling of metrics |
| metrics.serviceMonitors.prusaExporter.namespace | string | `""` | Namespace in which Prometheus is running. |
| metrics.serviceMonitors.prusaExporter.relabelings | list | `[]` | Specify general relabeling |
| metrics.serviceMonitors.prusaExporter.scrapeTimeout | string | `""` | Timeout after which the scrape is ended ref: https://github.com/coreos/prometheus-operator/blob/master/Documentation/api.md#endpoint |
| metrics.serviceMonitors.prusaExporter.selector | object | `{}` | Prometheus instance selector labels ref: https://github.com/bitnami/charts/tree/main/bitnami/prometheus-operator#prometheus-configuration |
| nameOverride | string | `""` | String to partially override common.names.name |
| namespaceOverride | string | `""` | String to fully override common.names.namespace |
| prusaExporter.affinity | object | `{}` | Affinity for prusaExporter pods assignment ref: https://kubernetes.io/docs/concepts/configuration/assign-pod-node/#affinity-and-anti-affinity NOTE: `prusaExporter.podAffinityPreset`, `prusaExporter.podAntiAffinityPreset`, and `prusaExporter.nodeAffinityPreset` will be ignored when it's set |
| prusaExporter.annotations | object | `{}` | Annotations for prusaExporter ref: https://kubernetes.io/docs/concepts/overview/working-with-objects/annotations/ |
| prusaExporter.args | list | `["--config.file=/config/prusa.yml","--log.level=info","--prusalink.scrape-timeout=5"]` | Override default prusaExporter container args (useful when using custom images) |
| prusaExporter.automountServiceAccountToken | bool | `false` | Mount Service Account token in prusaExporter pods |
| prusaExporter.command | list | `[]` | Override default prusaExporter container command (useful when using custom images) |
| prusaExporter.containerPorts | list | `[{"containerPort":10009,"name":"http","protocol":"TCP"},{"containerPort":8514,"name":"prusalink","protocol":"UDP"}]` | List of ports for prusaExporter containers |
| prusaExporter.containerSecurityContext.allowPrivilegeEscalation | bool | `false` | Set allowPrivilegeEscalation in prusaExporter container' Security Context |
| prusaExporter.containerSecurityContext.capabilities | object | `{"drop":["ALL"]}` | List of capabilities to be dropped in prusaExporter container |
| prusaExporter.containerSecurityContext.enabled | bool | `true` | Enabled prusaExporter container' Security Context |
| prusaExporter.containerSecurityContext.privileged | bool | `false` | Set privileged in prusaExporter container' Security Context |
| prusaExporter.containerSecurityContext.readOnlyRootFilesystem | bool | `true` | Set readOnlyRootFilesystem in prusaExporter container' Security Context |
| prusaExporter.containerSecurityContext.runAsGroup | int | `1001` |  |
| prusaExporter.containerSecurityContext.runAsNonRoot | bool | `true` | Set runAsNonRoot in prusaExporter container' Security Context |
| prusaExporter.containerSecurityContext.runAsUser | int | `1001` | Set runAsUser in prusaExporter container' Security Context |
| prusaExporter.containerSecurityContext.seLinuxOptions | object | `{}` | Set SELinux options in prusaExporter container |
| prusaExporter.containerSecurityContext.seccompProfile | object | `{"type":"RuntimeDefault"}` | Set seccomp profile in prusaExporter container |
| prusaExporter.customLivenessProbe | object | `{}` | Custom livenessProbe that overrides the default one |
| prusaExporter.customReadinessProbe | object | `{}` | Custom readinessProbe that overrides the default one |
| prusaExporter.customStartupProbe | object | `{}` | Custom startupProbe that overrides the default one |
| prusaExporter.extraEnvVars | list | `[]` | Array with extra environment variables to add to prusaExporter containers |
| prusaExporter.extraEnvVarsCM | string | `""` | Name of existing ConfigMap containing extra env vars for prusaExporter containers |
| prusaExporter.extraEnvVarsSecret | string | `""` | Name of existing Secret containing extra env vars for prusaExporter containers |
| prusaExporter.extraVolumeMounts | list | `[]` | Optionally specify extra list of additional volumeMounts for the prusaExporter containers |
| prusaExporter.extraVolumes | list | `[]` | Optionally specify extra list of additional volumes for the prusaExporter pods |
| prusaExporter.hostAliases | list | `[]` | prusaExporter pods host aliases ref: https://kubernetes.io/docs/concepts/services-networking/add-entries-to-pod-etc-hosts-with-host-aliases/ |
| prusaExporter.image.pullPolicy | string | `"IfNotPresent"` | The image pull policy ref: https://kubernetes.io/docs/concepts/containers/images/#pre-pulled-images |
| prusaExporter.image.pullSecrets | list | `[]` | Image pull secrets Secrets must be manually created in the namespace. ref: https://kubernetes.io/docs/tasks/configure-pod-container/pull-image-private-registry/ |
| prusaExporter.image.registry | string | `"docker.io"` | prusaExporter image registry |
| prusaExporter.image.repository | string | `"pubeldev/prusa_exporter"` | prusaExporter image repository |
| prusaExporter.image.tag | string | `"2.0.0-alpha2"` | prusaExporter image tag |
| prusaExporter.initContainers | list | `[]` | Add additional init containers to the prusaExporter pods ref: https://kubernetes.io/docs/concepts/workloads/pods/init-containers/ |
| prusaExporter.livenessProbe.enabled | bool | `true` | Enable livenessProbe on prusaExporter containers |
| prusaExporter.livenessProbe.failureThreshold | int | `3` | Failure threshold for livenessProbe |
| prusaExporter.livenessProbe.httpGet.path | string | `"/"` |  |
| prusaExporter.livenessProbe.httpGet.port | string | `"http"` |  |
| prusaExporter.livenessProbe.initialDelaySeconds | int | `0` | Initial delay seconds for livenessProbe |
| prusaExporter.livenessProbe.periodSeconds | int | `10` | Period seconds for livenessProbe |
| prusaExporter.livenessProbe.successThreshold | int | `1` | Success threshold for livenessProbe |
| prusaExporter.livenessProbe.timeoutSeconds | int | `1` | Timeout seconds for livenessProbe |
| prusaExporter.nodeAffinityPreset.key | string | `""` | Node label key to match. Ignored if `prusaExporter.affinity` is set |
| prusaExporter.nodeAffinityPreset.type | string | `""` | Node affinity preset type. Ignored if `prusaExporter.affinity` is set. Allowed values: `soft` or `hard` |
| prusaExporter.nodeAffinityPreset.values | list | `[]` | Node label values to match. Ignored if `prusaExporter.affinity` is set |
| prusaExporter.nodeSelector | object | `{}` | Node labels for prusaExporter pods assignment ref: https://kubernetes.io/docs/concepts/scheduling-eviction/assign-pod-node/ |
| prusaExporter.podAffinityPreset | string | `""` | Pod affinity preset. Ignored if `prusaExporter.affinity` is set. Allowed values: `soft` or `hard` ref: https://kubernetes.io/docs/concepts/scheduling-eviction/assign-pod-node/#inter-pod-affinity-and-anti-affinity |
| prusaExporter.podAnnotations | object | `{}` | Annotations for prusaExporter pods ref: https://kubernetes.io/docs/concepts/overview/working-with-objects/annotations/ |
| prusaExporter.podAntiAffinityPreset | string | `"soft"` | Pod anti-affinity preset. Ignored if `prusaExporter.affinity` is set. Allowed values: `soft` or `hard` ref: https://kubernetes.io/docs/concepts/scheduling-eviction/assign-pod-node/#inter-pod-affinity-and-anti-affinity |
| prusaExporter.podLabels | object | `{}` | Extra labels for prusaExporter pods ref: https://kubernetes.io/docs/concepts/overview/working-with-objects/labels/ |
| prusaExporter.podSecurityContext.enabled | bool | `true` | Enable prusaExporter pods' Security Context |
| prusaExporter.podSecurityContext.fsGroup | int | `1001` | Set fsGroup in prusaExporter pods' Security Context |
| prusaExporter.podSecurityContext.fsGroupChangePolicy | string | `"Always"` | Set filesystem group change policy for prusaExporter pods |
| prusaExporter.podSecurityContext.supplementalGroups | list | `[]` | Set filesystem extra groups for prusaExporter pods |
| prusaExporter.podSecurityContext.sysctls | list | `[]` | settings using the sysctl interface for prusaExporter pods |
| prusaExporter.readinessProbe.enabled | bool | `true` | Enable readinessProbe on prusaExporter containers |
| prusaExporter.readinessProbe.failureThreshold | int | `3` | Failure threshold for readinessProbe |
| prusaExporter.readinessProbe.httpGet.path | string | `"/"` |  |
| prusaExporter.readinessProbe.httpGet.port | string | `"http"` |  |
| prusaExporter.readinessProbe.initialDelaySeconds | int | `0` | Initial delay seconds for readinessProbe |
| prusaExporter.readinessProbe.periodSeconds | int | `10` | Period seconds for readinessProbe |
| prusaExporter.readinessProbe.successThreshold | int | `1` | Success threshold for readinessProbe |
| prusaExporter.readinessProbe.timeoutSeconds | int | `1` | Timeout seconds for readinessProbe |
| prusaExporter.replicaCount | int | `1` | Number of prusaExporter replicas to deploy |
| prusaExporter.resources | object | `{}` | Set prusaExporter container requests and limits for different resources like CPU or memory (essential for production workloads) |
| prusaExporter.resourcesPreset | string | `"nano"` | Set prusaExporter container resources according to one common preset (allowed values: none, nano, small, medium, large, xlarge, 2xlarge). This is ignored if prusaExporter.resources is set (prusaExporter.resources is recommended for production). More information: https://github.com/bitnami/charts/blob/main/bitnami/common/templates/_resources.tpl#L15 |
| prusaExporter.sidecars | list | `[]` | Add additional sidecar containers to the prusaExporter pods |
| prusaExporter.startupProbe.enabled | bool | `false` | Enable startupProbe on prusaExporter containers |
| prusaExporter.startupProbe.failureThreshold | int | `3` | Failure threshold for startupProbe |
| prusaExporter.startupProbe.httpGet.path | string | `"/"` |  |
| prusaExporter.startupProbe.httpGet.port | string | `"http"` |  |
| prusaExporter.startupProbe.initialDelaySeconds | int | `0` | Initial delay seconds for startupProbe |
| prusaExporter.startupProbe.periodSeconds | int | `10` | Period seconds for startupProbe |
| prusaExporter.startupProbe.successThreshold | int | `1` | Success threshold for startupProbe |
| prusaExporter.startupProbe.timeoutSeconds | int | `1` | Timeout seconds for startupProbe |
| prusaExporter.terminationGracePeriodSeconds | string | `""` | Seconds prusaExporter pods need to terminate gracefully ref: https://kubernetes.io/docs/concepts/workloads/pods/pod/#termination-of-pods |
| prusaExporter.tolerations | list | `[]` | Tolerations for prusaExporter pods assignment ref: https://kubernetes.io/docs/concepts/configuration/taint-and-toleration/ |
| prusaExporter.updateStrategy | object | `{"type":"RollingUpdate"}` | Deployment strategy type ref: https://kubernetes.io/docs/concepts/workloads/controllers/deployment/#strategy |
| prusaExporterSecret.existingSecret | string | `""` |  |
| prusaExporterSecret.prusa | string | `""` |  |
| serviceAccount.annotations | object | `{}` | Additional Service Account annotations (evaluated as a template) |
| serviceAccount.automountServiceAccountToken | bool | `true` | Automount service account token for the server service account |
| serviceAccount.create | bool | `true` | Specifies whether a ServiceAccount should be created |
| serviceAccount.name | string | `""` | The name of the ServiceAccount to use. If not set and create is true, a name is generated using the common.names.fullname template |
| services.prusaExporter.annotations | object | `{}` | Additional custom annotations for prusaExporter service |
| services.prusaExporter.clusterIP | string | `""` | prusaExporter service Cluster IP |
| services.prusaExporter.externalTrafficPolicy | string | `"Cluster"` | prusaExporter service external traffic policy ref http://kubernetes.io/docs/tasks/access-application-cluster/create-external-load-balancer/#preserving-the-client-source-ip |
| services.prusaExporter.extraPorts | list | `[]` | Extra ports to expose in prusaExporter service (normally used with the `sidecars` value) |
| services.prusaExporter.loadBalancerIP | string | `""` | prusaExporter service Load Balancer IP ref: https://kubernetes.io/docs/concepts/services-networking/service/#type-loadbalancer |
| services.prusaExporter.loadBalancerSourceRanges | list | `[]` | prusaExporter service Load Balancer sources ref: https://kubernetes.io/docs/tasks/access-application-cluster/configure-cloud-provider-firewall/#restrict-access-for-loadbalancer-service |
| services.prusaExporter.ports[0].name | string | `"http"` |  |
| services.prusaExporter.ports[0].port | int | `10009` |  |
| services.prusaExporter.ports[0].protocol | string | `"TCP"` |  |
| services.prusaExporter.sessionAffinity | string | `"None"` | Control where client requests go, to the same pod or round-robin Values: ClientIP or None ref: https://kubernetes.io/docs/concepts/services-networking/service/ |
| services.prusaExporter.sessionAffinityConfig | object | `{}` | Additional settings for the sessionAffinity |
| services.prusaExporter.type | string | `"ClusterIP"` | The service type |
| services.prusaExporterPrusalink.annotations | object | `{}` | Additional custom annotations for prusaExporterPrusalink service |
| services.prusaExporterPrusalink.clusterIP | string | `""` | prusaExporterPrusalink service Cluster IP |
| services.prusaExporterPrusalink.externalTrafficPolicy | string | `"Cluster"` | prusaExporterPrusalink service external traffic policy ref http://kubernetes.io/docs/tasks/access-application-cluster/create-external-load-balancer/#preserving-the-client-source-ip |
| services.prusaExporterPrusalink.extraPorts | list | `[]` | Extra ports to expose in prusaExporterPrusalink service (normally used with the `sidecars` value) |
| services.prusaExporterPrusalink.loadBalancerIP | string | `""` | prusaExporterPrusalink service Load Balancer IP ref: https://kubernetes.io/docs/concepts/services-networking/service/#type-loadbalancer |
| services.prusaExporterPrusalink.loadBalancerSourceRanges | list | `[]` | prusaExporterPrusalink service Load Balancer sources ref: https://kubernetes.io/docs/tasks/access-application-cluster/configure-cloud-provider-firewall/#restrict-access-for-loadbalancer-service |
| services.prusaExporterPrusalink.ports[0].name | string | `"prusalink"` |  |
| services.prusaExporterPrusalink.ports[0].port | int | `8514` |  |
| services.prusaExporterPrusalink.ports[0].protocol | string | `"UDP"` |  |
| services.prusaExporterPrusalink.sessionAffinity | string | `"None"` | Control where client requests go, to the same pod or round-robin Values: ClientIP or None ref: https://kubernetes.io/docs/concepts/services-networking/service/ |
| services.prusaExporterPrusalink.sessionAffinityConfig | object | `{}` | Additional settings for the sessionAffinity |
| services.prusaExporterPrusalink.type | string | `"LoadBalancer"` | The service type |

