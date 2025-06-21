# bar-assistant

![Version: 0.1.0](https://img.shields.io/badge/Version-0.1.0-informational?style=flat-square) ![AppVersion: 5.5.1](https://img.shields.io/badge/AppVersion-5.5.1-informational?style=flat-square)

Bar assistant is a self hosted application for managing your home bar.

**Homepage:** <https://bar-assistant.app>

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| Tom Helander |  | <https://github.com/thelande/charts> |

## Source Code

* <https://github.com/thelande/charts/tree/main/charts/bar-assistant>
* <https://github.com/karlomikus/bar-assistant>

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| oci://registry-1.docker.io/bitnamicharts | common | 2.x.x |
| oci://registry-1.docker.io/bitnamicharts | redis | 20.13.x |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| apiVersions | list | `[]` | Override Kubernetes API versions reported by .Capabilities |
| barAssistant.affinity | object | `{}` | Affinity for barAssistant pods assignment ref: https://kubernetes.io/docs/concepts/configuration/assign-pod-node/#affinity-and-anti-affinity NOTE: `barAssistant.podAffinityPreset`, `barAssistant.podAntiAffinityPreset`, and `barAssistant.nodeAffinityPreset` will be ignored when it's set |
| barAssistant.annotations | object | `{}` | Annotations for barAssistant ref: https://kubernetes.io/docs/concepts/overview/working-with-objects/annotations/ |
| barAssistant.args | list | `[]` | Override default barAssistant container args (useful when using custom images) |
| barAssistant.automountServiceAccountToken | bool | `false` | Mount Service Account token in barAssistant pods |
| barAssistant.command | list | `[]` | Override default barAssistant container command (useful when using custom images) |
| barAssistant.containerPorts | list | `[{"containerPort":8080,"name":"http","protocol":"TCP"}]` | List of ports for barAssistant containers |
| barAssistant.containerSecurityContext.allowPrivilegeEscalation | bool | `false` | Set allowPrivilegeEscalation in barAssistant container' Security Context |
| barAssistant.containerSecurityContext.capabilities | object | `{"drop":["ALL"]}` | List of capabilities to be dropped in barAssistant container |
| barAssistant.containerSecurityContext.enabled | bool | `true` | Enabled barAssistant container' Security Context |
| barAssistant.containerSecurityContext.privileged | bool | `false` | Set privileged in barAssistant container' Security Context |
| barAssistant.containerSecurityContext.readOnlyRootFilesystem | bool | `true` | Set readOnlyRootFilesystem in barAssistant container' Security Context |
| barAssistant.containerSecurityContext.runAsGroup | int | `1001` |  |
| barAssistant.containerSecurityContext.runAsNonRoot | bool | `true` | Set runAsNonRoot in barAssistant container' Security Context |
| barAssistant.containerSecurityContext.runAsUser | int | `1001` | Set runAsUser in barAssistant container' Security Context |
| barAssistant.containerSecurityContext.seLinuxOptions | object | `{}` | Set SELinux options in barAssistant container |
| barAssistant.containerSecurityContext.seccompProfile | object | `{"type":"RuntimeDefault"}` | Set seccomp profile in barAssistant container |
| barAssistant.customLivenessProbe | object | `{}` | Custom livenessProbe that overrides the default one |
| barAssistant.customReadinessProbe | object | `{}` | Custom readinessProbe that overrides the default one |
| barAssistant.customStartupProbe | object | `{}` | Custom startupProbe that overrides the default one |
| barAssistant.extraEnvVars | list | `[]` | Array with extra environment variables to add to barAssistant containers |
| barAssistant.extraEnvVarsCM | string | `""` | Name of existing ConfigMap containing extra env vars for barAssistant containers |
| barAssistant.extraEnvVarsSecret | string | `""` | Name of existing Secret containing extra env vars for barAssistant containers |
| barAssistant.extraVolumeMounts | list | `[]` | Optionally specify extra list of additional volumeMounts for the barAssistant containers |
| barAssistant.extraVolumes | list | `[]` | Optionally specify extra list of additional volumes for the barAssistant pods |
| barAssistant.hostAliases | list | `[]` | barAssistant pods host aliases ref: https://kubernetes.io/docs/concepts/services-networking/add-entries-to-pod-etc-hosts-with-host-aliases/ |
| barAssistant.image.pullPolicy | string | `"IfNotPresent"` | The image pull policy ref: https://kubernetes.io/docs/concepts/containers/images/#pre-pulled-images |
| barAssistant.image.pullSecrets | list | `[]` | Image pull secrets Secrets must be manually created in the namespace. ref: https://kubernetes.io/docs/tasks/configure-pod-container/pull-image-private-registry/ |
| barAssistant.image.registry | string | `"docker.io"` | barAssistant image registry |
| barAssistant.image.repository | string | `"barassistant/server"` | barAssistant image repository |
| barAssistant.image.tag | string | `"5.5.1"` | barAssistant image tag |
| barAssistant.initContainers | list | `[]` | Add additional init containers to the barAssistant pods ref: https://kubernetes.io/docs/concepts/workloads/pods/init-containers/ |
| barAssistant.livenessProbe.enabled | bool | `true` | Enable livenessProbe on barAssistant containers |
| barAssistant.livenessProbe.failureThreshold | int | `3` | Failure threshold for livenessProbe |
| barAssistant.livenessProbe.httpGet.path | string | `"/docs"` |  |
| barAssistant.livenessProbe.httpGet.port | string | `"http"` |  |
| barAssistant.livenessProbe.initialDelaySeconds | int | `60` | Initial delay seconds for livenessProbe |
| barAssistant.livenessProbe.periodSeconds | int | `10` | Period seconds for livenessProbe |
| barAssistant.livenessProbe.successThreshold | int | `1` | Success threshold for livenessProbe |
| barAssistant.livenessProbe.timeoutSeconds | int | `1` | Timeout seconds for livenessProbe |
| barAssistant.nodeAffinityPreset.key | string | `""` | Node label key to match. Ignored if `barAssistant.affinity` is set |
| barAssistant.nodeAffinityPreset.type | string | `""` | Node affinity preset type. Ignored if `barAssistant.affinity` is set. Allowed values: `soft` or `hard` |
| barAssistant.nodeAffinityPreset.values | list | `[]` | Node label values to match. Ignored if `barAssistant.affinity` is set |
| barAssistant.nodeSelector | object | `{}` | Node labels for barAssistant pods assignment ref: https://kubernetes.io/docs/concepts/scheduling-eviction/assign-pod-node/ |
| barAssistant.persistence.enabled | bool | `false` | Enable persistence using Persistent Volume Claims |
| barAssistant.podAffinityPreset | string | `""` | Pod affinity preset. Ignored if `barAssistant.affinity` is set. Allowed values: `soft` or `hard` ref: https://kubernetes.io/docs/concepts/scheduling-eviction/assign-pod-node/#inter-pod-affinity-and-anti-affinity |
| barAssistant.podAnnotations | object | `{}` | Annotations for barAssistant pods ref: https://kubernetes.io/docs/concepts/overview/working-with-objects/annotations/ |
| barAssistant.podAntiAffinityPreset | string | `"soft"` | Pod anti-affinity preset. Ignored if `barAssistant.affinity` is set. Allowed values: `soft` or `hard` ref: https://kubernetes.io/docs/concepts/scheduling-eviction/assign-pod-node/#inter-pod-affinity-and-anti-affinity |
| barAssistant.podLabels | object | `{}` | Extra labels for barAssistant pods ref: https://kubernetes.io/docs/concepts/overview/working-with-objects/labels/ |
| barAssistant.podManagementPolicy | string | `"OrderedReady"` | Pod management policy for barAssistant statefulset ref: https://kubernetes.io/docs/concepts/workloads/controllers/statefulset/#pod-management-policies |
| barAssistant.podSecurityContext.enabled | bool | `true` | Enable barAssistant pods' Security Context |
| barAssistant.podSecurityContext.fsGroup | int | `1001` | Set fsGroup in barAssistant pods' Security Context |
| barAssistant.podSecurityContext.fsGroupChangePolicy | string | `"Always"` | Set filesystem group change policy for barAssistant pods |
| barAssistant.podSecurityContext.supplementalGroups | list | `[]` | Set filesystem extra groups for barAssistant pods |
| barAssistant.podSecurityContext.sysctls | list | `[]` | settings using the sysctl interface for barAssistant pods |
| barAssistant.readinessProbe.enabled | bool | `true` | Enable readinessProbe on barAssistant containers |
| barAssistant.readinessProbe.failureThreshold | int | `3` | Failure threshold for readinessProbe |
| barAssistant.readinessProbe.httpGet.path | string | `"/docs"` |  |
| barAssistant.readinessProbe.httpGet.port | string | `"http"` |  |
| barAssistant.readinessProbe.initialDelaySeconds | int | `60` | Initial delay seconds for readinessProbe |
| barAssistant.readinessProbe.periodSeconds | int | `10` | Period seconds for readinessProbe |
| barAssistant.readinessProbe.successThreshold | int | `1` | Success threshold for readinessProbe |
| barAssistant.readinessProbe.timeoutSeconds | int | `1` | Timeout seconds for readinessProbe |
| barAssistant.replicaCount | int | `1` | Number of barAssistant replicas to deploy |
| barAssistant.resources | object | `{}` | Set barAssistant container requests and limits for different resources like CPU or memory (essential for production workloads) |
| barAssistant.resourcesPreset | string | `"nano"` | Set barAssistant container resources according to one common preset (allowed values: none, nano, small, medium, large, xlarge, 2xlarge). This is ignored if barAssistant.resources is set (barAssistant.resources is recommended for production). More information: https://github.com/bitnami/charts/blob/main/bitnami/common/templates/_resources.tpl#L15 |
| barAssistant.sidecars | list | `[]` | Add additional sidecar containers to the barAssistant pods |
| barAssistant.startupProbe.enabled | bool | `false` | Enable startupProbe on barAssistant containers |
| barAssistant.startupProbe.failureThreshold | int | `3` | Failure threshold for startupProbe |
| barAssistant.startupProbe.httpGet.path | string | `"/"` |  |
| barAssistant.startupProbe.httpGet.port | string | `"http"` |  |
| barAssistant.startupProbe.initialDelaySeconds | int | `0` | Initial delay seconds for startupProbe |
| barAssistant.startupProbe.periodSeconds | int | `10` | Period seconds for startupProbe |
| barAssistant.startupProbe.successThreshold | int | `1` | Success threshold for startupProbe |
| barAssistant.startupProbe.timeoutSeconds | int | `1` | Timeout seconds for startupProbe |
| barAssistant.terminationGracePeriodSeconds | string | `""` | Seconds barAssistant pods need to terminate gracefully ref: https://kubernetes.io/docs/concepts/workloads/pods/pod/#termination-of-pods |
| barAssistant.tolerations | list | `[]` | Tolerations for barAssistant pods assignment ref: https://kubernetes.io/docs/concepts/configuration/taint-and-toleration/ |
| barAssistant.updateStrategy | object | `{"type":"RollingUpdate"}` | Statefulset strategy type ref: https://kubernetes.io/docs/concepts/workloads/controllers/deployment/#strategy |
| barAssistant.volumePermissions | object | `{"containerSecurityContext":{"enabled":true,"runAsUser":0,"seLinuxOptions":{}},"enabled":false,"image":{"pullPolicy":"IfNotPresent","pullSecrets":[],"registry":"docker.io","repository":"bitnami/os-shell","tag":"12-debian-12-r43"},"resources":{},"resourcesPreset":"nano"}` | 'volumePermissions' init container parameters Changes the owner and group of the persistent volume mount point to runAsUser:fsGroup values based on the *podSecurityContext/*containerSecurityContext parameters |
| barAssistant.volumePermissions.enabled | bool | `false` | Enable init container that changes the owner/group of the PV mount point to `runAsUser:fsGroup` |
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
| ingress.barAssistant.annotations | object | `{"nginx.ingress.kubernetes.io/rewrite-target":"/$2","nginx.ingress.kubernetes.io/use-regex":"true"}` | Additional annotations for the Ingress resource. To enable certificate autogeneration, place here your cert-manager annotations. Use this parameter to set the required annotations for cert-manager, see ref: https://cert-manager.io/docs/usage/ingress/#supported-annotations |
| ingress.barAssistant.apiVersion | string | `""` | Force Ingress API version (automatically detected if not set) |
| ingress.barAssistant.enabled | bool | `false` | Enable ingress record generation for bar-assistant |
| ingress.barAssistant.extraHosts | list | `[]` | An array with additional hostname(s) to be covered with the ingress record |
| ingress.barAssistant.extraPaths | list | `[{"backend":{"service":{"name":"bar-assistant-meili","port":{"name":"http"}}},"path":"/search(/|$)(.*)","pathType":"ImplementationSpecific"}]` | An array with additional arbitrary paths that may need to be added to the ingress under the main host |
| ingress.barAssistant.extraRules | list | `[]` | Additional rules to be covered with this ingress record ref: https://kubernetes.io/docs/concepts/services-networking/ingress/#ingress-rules |
| ingress.barAssistant.extraTls | list | `[]` | TLS configuration for additional hostname(s) to be covered with this ingress record ref: https://kubernetes.io/docs/concepts/services-networking/ingress/#tls |
| ingress.barAssistant.hostname | string | `"bar-assistant.local"` | Default host for the ingress record |
| ingress.barAssistant.ingressClassName | string | `""` | IngressClass that will be be used to implement the Ingress (Kubernetes 1.18+) This is supported in Kubernetes 1.18+ and required if you have more than one IngressClass marked as the default for your cluster . ref: https://kubernetes.io/blog/2020/04/02/improvements-to-the-ingress-api-in-kubernetes-1.18/ |
| ingress.barAssistant.labels | object | `{}` | Additional labels for the Ingress resource. |
| ingress.barAssistant.path | string | `"/bar(/|$)(.*)"` | Default path for the ingress record NOTE: You may need to set this to '/*' in order to use this with ALB ingress controllers |
| ingress.barAssistant.pathType | string | `"ImplementationSpecific"` | Ingress path type |
| ingress.barAssistant.secrets | list | `[]` | Custom TLS certificates as secrets NOTE: 'key' and 'certificate' are expected in PEM format NOTE: 'name' should line up with a 'secretName' set further up |
| ingress.barAssistant.selfSigned | bool | `false` | Create a TLS secret for this ingress record using self-signed certificates generated by Helm |
| ingress.barAssistant.tls | bool | `false` | Enable TLS configuration for the host defined at `ingress.hostname` parameter TLS certificates will be retrieved from a TLS secret with name: `{{- printf "%s-tls" .Values.ingress.hostname }}` You can:   - Use the `ingress.secrets` parameter to create this TLS secret   - Rely on cert-manager to create it by setting the corresponding annotations   - Rely on Helm to create self-signed certificates by setting `ingress.selfSigned=true` |
| ingress.saltRim.annotations | object | `{}` | Additional annotations for the Ingress resource. To enable certificate autogeneration, place here your cert-manager annotations. Use this parameter to set the required annotations for cert-manager, see ref: https://cert-manager.io/docs/usage/ingress/#supported-annotations |
| ingress.saltRim.apiVersion | string | `""` | Force Ingress API version (automatically detected if not set) |
| ingress.saltRim.enabled | bool | `false` | Enable ingress record generation for salt-rim |
| ingress.saltRim.extraHosts | list | `[]` | An array with additional hostname(s) to be covered with the ingress record |
| ingress.saltRim.extraPaths | list | `[]` | An array with additional arbitrary paths that may need to be added to the ingress under the main host |
| ingress.saltRim.extraRules | list | `[]` | Additional rules to be covered with this ingress record ref: https://kubernetes.io/docs/concepts/services-networking/ingress/#ingress-rules |
| ingress.saltRim.extraTls | list | `[]` | TLS configuration for additional hostname(s) to be covered with this ingress record ref: https://kubernetes.io/docs/concepts/services-networking/ingress/#tls |
| ingress.saltRim.hostname | string | `"salt-rim.local"` | Default host for the ingress record |
| ingress.saltRim.ingressClassName | string | `""` | IngressClass that will be be used to implement the Ingress (Kubernetes 1.18+) This is supported in Kubernetes 1.18+ and required if you have more than one IngressClass marked as the default for your cluster . ref: https://kubernetes.io/blog/2020/04/02/improvements-to-the-ingress-api-in-kubernetes-1.18/ |
| ingress.saltRim.labels | object | `{}` | Additional labels for the Ingress resource. |
| ingress.saltRim.path | string | `"/"` | Default path for the ingress record NOTE: You may need to set this to '/*' in order to use this with ALB ingress controllers |
| ingress.saltRim.pathType | string | `"Prefix"` | Ingress path type |
| ingress.saltRim.secrets | list | `[]` | Custom TLS certificates as secrets NOTE: 'key' and 'certificate' are expected in PEM format NOTE: 'name' should line up with a 'secretName' set further up |
| ingress.saltRim.selfSigned | bool | `false` | Create a TLS secret for this ingress record using self-signed certificates generated by Helm |
| ingress.saltRim.tls | bool | `false` | Enable TLS configuration for the host defined at `ingress.hostname` parameter TLS certificates will be retrieved from a TLS secret with name: `{{- printf "%s-tls" .Values.ingress.hostname }}` You can:   - Use the `ingress.secrets` parameter to create this TLS secret   - Rely on cert-manager to create it by setting the corresponding annotations   - Rely on Helm to create self-signed certificates by setting `ingress.selfSigned=true` |
| kubeVersion | string | `""` | Override Kubernetes version |
| meili.affinity | object | `{}` | Affinity for meili pods assignment ref: https://kubernetes.io/docs/concepts/configuration/assign-pod-node/#affinity-and-anti-affinity NOTE: `meili.podAffinityPreset`, `meili.podAntiAffinityPreset`, and `meili.nodeAffinityPreset` will be ignored when it's set |
| meili.annotations | object | `{}` | Annotations for meili ref: https://kubernetes.io/docs/concepts/overview/working-with-objects/annotations/ |
| meili.args | list | `[]` | Override default meili container args (useful when using custom images) |
| meili.automountServiceAccountToken | bool | `false` | Mount Service Account token in meili pods |
| meili.command | list | `[]` | Override default meili container command (useful when using custom images) |
| meili.containerPorts | list | `[{"containerPort":7700,"name":"http","protocol":"TCP"}]` | List of ports for meili containers |
| meili.containerSecurityContext.allowPrivilegeEscalation | bool | `false` | Set allowPrivilegeEscalation in meili container' Security Context |
| meili.containerSecurityContext.capabilities | object | `{"drop":["ALL"]}` | List of capabilities to be dropped in meili container |
| meili.containerSecurityContext.enabled | bool | `true` | Enabled meili container' Security Context |
| meili.containerSecurityContext.privileged | bool | `false` | Set privileged in meili container' Security Context |
| meili.containerSecurityContext.readOnlyRootFilesystem | bool | `true` | Set readOnlyRootFilesystem in meili container' Security Context |
| meili.containerSecurityContext.runAsGroup | int | `1001` |  |
| meili.containerSecurityContext.runAsNonRoot | bool | `true` | Set runAsNonRoot in meili container' Security Context |
| meili.containerSecurityContext.runAsUser | int | `1001` | Set runAsUser in meili container' Security Context |
| meili.containerSecurityContext.seLinuxOptions | object | `{}` | Set SELinux options in meili container |
| meili.containerSecurityContext.seccompProfile | object | `{"type":"RuntimeDefault"}` | Set seccomp profile in meili container |
| meili.customLivenessProbe | object | `{}` | Custom livenessProbe that overrides the default one |
| meili.customReadinessProbe | object | `{}` | Custom readinessProbe that overrides the default one |
| meili.customStartupProbe | object | `{}` | Custom startupProbe that overrides the default one |
| meili.extraEnvVars | list | `[]` | Array with extra environment variables to add to meili containers |
| meili.extraEnvVarsCM | string | `""` | Name of existing ConfigMap containing extra env vars for meili containers |
| meili.extraEnvVarsSecret | string | `"meili-master-key"` | Name of existing Secret containing extra env vars for meili containers |
| meili.extraVolumeMounts | list | `[]` | Optionally specify extra list of additional volumeMounts for the meili containers |
| meili.extraVolumes | list | `[]` | Optionally specify extra list of additional volumes for the meili pods |
| meili.hostAliases | list | `[]` | meili pods host aliases ref: https://kubernetes.io/docs/concepts/services-networking/add-entries-to-pod-etc-hosts-with-host-aliases/ |
| meili.image.pullPolicy | string | `"IfNotPresent"` | The image pull policy ref: https://kubernetes.io/docs/concepts/containers/images/#pre-pulled-images |
| meili.image.pullSecrets | list | `[]` | Image pull secrets Secrets must be manually created in the namespace. ref: https://kubernetes.io/docs/tasks/configure-pod-container/pull-image-private-registry/ |
| meili.image.registry | string | `"docker.io"` | meili image registry |
| meili.image.repository | string | `"getmeili/meilisearch"` | meili image repository |
| meili.image.tag | string | `"v1.15"` | meili image tag |
| meili.initContainers | list | `[]` | Add additional init containers to the meili pods ref: https://kubernetes.io/docs/concepts/workloads/pods/init-containers/ |
| meili.livenessProbe.enabled | bool | `true` | Enable livenessProbe on meili containers |
| meili.livenessProbe.failureThreshold | int | `3` | Failure threshold for livenessProbe |
| meili.livenessProbe.httpGet.path | string | `"/"` |  |
| meili.livenessProbe.httpGet.port | string | `"http"` |  |
| meili.livenessProbe.initialDelaySeconds | int | `0` | Initial delay seconds for livenessProbe |
| meili.livenessProbe.periodSeconds | int | `10` | Period seconds for livenessProbe |
| meili.livenessProbe.successThreshold | int | `1` | Success threshold for livenessProbe |
| meili.livenessProbe.timeoutSeconds | int | `1` | Timeout seconds for livenessProbe |
| meili.nodeAffinityPreset.key | string | `""` | Node label key to match. Ignored if `meili.affinity` is set |
| meili.nodeAffinityPreset.type | string | `""` | Node affinity preset type. Ignored if `meili.affinity` is set. Allowed values: `soft` or `hard` |
| meili.nodeAffinityPreset.values | list | `[]` | Node label values to match. Ignored if `meili.affinity` is set |
| meili.nodeSelector | object | `{}` | Node labels for meili pods assignment ref: https://kubernetes.io/docs/concepts/scheduling-eviction/assign-pod-node/ |
| meili.podAffinityPreset | string | `""` | Pod affinity preset. Ignored if `meili.affinity` is set. Allowed values: `soft` or `hard` ref: https://kubernetes.io/docs/concepts/scheduling-eviction/assign-pod-node/#inter-pod-affinity-and-anti-affinity |
| meili.podAnnotations | object | `{}` | Annotations for meili pods ref: https://kubernetes.io/docs/concepts/overview/working-with-objects/annotations/ |
| meili.podAntiAffinityPreset | string | `"soft"` | Pod anti-affinity preset. Ignored if `meili.affinity` is set. Allowed values: `soft` or `hard` ref: https://kubernetes.io/docs/concepts/scheduling-eviction/assign-pod-node/#inter-pod-affinity-and-anti-affinity |
| meili.podLabels | object | `{}` | Extra labels for meili pods ref: https://kubernetes.io/docs/concepts/overview/working-with-objects/labels/ |
| meili.podSecurityContext.enabled | bool | `true` | Enable meili pods' Security Context |
| meili.podSecurityContext.fsGroup | int | `1001` | Set fsGroup in meili pods' Security Context |
| meili.podSecurityContext.fsGroupChangePolicy | string | `"Always"` | Set filesystem group change policy for meili pods |
| meili.podSecurityContext.supplementalGroups | list | `[]` | Set filesystem extra groups for meili pods |
| meili.podSecurityContext.sysctls | list | `[]` | settings using the sysctl interface for meili pods |
| meili.readinessProbe.enabled | bool | `true` | Enable readinessProbe on meili containers |
| meili.readinessProbe.failureThreshold | int | `3` | Failure threshold for readinessProbe |
| meili.readinessProbe.httpGet.path | string | `"/"` |  |
| meili.readinessProbe.httpGet.port | string | `"http"` |  |
| meili.readinessProbe.initialDelaySeconds | int | `0` | Initial delay seconds for readinessProbe |
| meili.readinessProbe.periodSeconds | int | `10` | Period seconds for readinessProbe |
| meili.readinessProbe.successThreshold | int | `1` | Success threshold for readinessProbe |
| meili.readinessProbe.timeoutSeconds | int | `1` | Timeout seconds for readinessProbe |
| meili.replicaCount | int | `1` | Number of meili replicas to deploy |
| meili.resources | object | `{}` | Set meili container requests and limits for different resources like CPU or memory (essential for production workloads) |
| meili.resourcesPreset | string | `"nano"` | Set meili container resources according to one common preset (allowed values: none, nano, small, medium, large, xlarge, 2xlarge). This is ignored if meili.resources is set (meili.resources is recommended for production). More information: https://github.com/bitnami/charts/blob/main/bitnami/common/templates/_resources.tpl#L15 |
| meili.sidecars | list | `[]` | Add additional sidecar containers to the meili pods |
| meili.startupProbe.enabled | bool | `false` | Enable startupProbe on meili containers |
| meili.startupProbe.failureThreshold | int | `3` | Failure threshold for startupProbe |
| meili.startupProbe.httpGet.path | string | `"/"` |  |
| meili.startupProbe.httpGet.port | string | `"http"` |  |
| meili.startupProbe.initialDelaySeconds | int | `0` | Initial delay seconds for startupProbe |
| meili.startupProbe.periodSeconds | int | `10` | Period seconds for startupProbe |
| meili.startupProbe.successThreshold | int | `1` | Success threshold for startupProbe |
| meili.startupProbe.timeoutSeconds | int | `1` | Timeout seconds for startupProbe |
| meili.terminationGracePeriodSeconds | string | `""` | Seconds meili pods need to terminate gracefully ref: https://kubernetes.io/docs/concepts/workloads/pods/pod/#termination-of-pods |
| meili.tolerations | list | `[]` | Tolerations for meili pods assignment ref: https://kubernetes.io/docs/concepts/configuration/taint-and-toleration/ |
| meili.updateStrategy | object | `{"type":"RollingUpdate"}` | Deployment strategy type ref: https://kubernetes.io/docs/concepts/workloads/controllers/deployment/#strategy |
| meiliMasterKeySecret.existingSecret | string | `""` |  |
| meiliMasterKeySecret.value | string | `""` |  |
| metrics.enabled | bool | `false` |  |
| nameOverride | string | `""` | String to partially override common.names.name |
| namespaceOverride | string | `""` | String to fully override common.names.namespace |
| oauth.baseUrl | string | `""` | The base URL of the OAuth host. |
| oauth.client.existingSecret | string | `""` | Existing secret containing the client ID and secret (keys should be clientID and clientSecret) |
| oauth.client.id | string | `""` | The client id of your configured client in your provider |
| oauth.client.secret | string | `""` | The client secret of your configured client in your provider |
| oauth.enabled | bool | `false` | Enables authentication via OAuth |
| oauth.realm | string | `""` | The OAuth realm (Keycloak). |
| oauth.redirectUri | string | `""` | The redirect URI |
| persistence.barAssistant.accessModes | list | `["ReadWriteOnce"]` | Persistent Volume Access Modes |
| persistence.barAssistant.annotations | object | `{}` | Persistent Volume Claim annotations |
| persistence.barAssistant.dataSource | object | `{}` | Custom PVC data source |
| persistence.barAssistant.enabled | bool | `false` | Enable persistence using Persistent Volume Claims |
| persistence.barAssistant.existingClaim | string | `""` | The name of an existing PVC to use for persistence |
| persistence.barAssistant.mountPath | string | `"/data/bar-data"` | Path to mount the volume at. |
| persistence.barAssistant.selector | object | `{}` | Selector to match an existing Persistent Volume for WordPress data PVC If set, the PVC can't have a PV dynamically provisioned for it |
| persistence.barAssistant.size | string | `"8Gi"` | Size of data volume |
| persistence.barAssistant.storageClass | string | `""` | Storage class of backing PVC If defined, storageClassName: <storageClass> If set to "-", storageClassName: "", which disables dynamic provisioning If undefined (the default) or set to null, no storageClassName spec is   set, choosing the default provisioner.  (gp2 on AWS, standard on   GKE, AWS & OpenStack) |
| persistence.barAssistant.subPath | string | `""` | The subdirectory of the volume to mount to, useful in dev environments and one PV for multiple services |
| persistence.meili.accessModes | list | `["ReadWriteOnce"]` | Persistent Volume Access Modes |
| persistence.meili.annotations | object | `{}` | Persistent Volume Claim annotations |
| persistence.meili.dataSource | object | `{}` | Custom PVC data source |
| persistence.meili.enabled | bool | `false` | Enable persistence using Persistent Volume Claims |
| persistence.meili.existingClaim | string | `""` | The name of an existing PVC to use for persistence |
| persistence.meili.mountPath | string | `"/data/meilisearch-data"` | Path to mount the volume at. |
| persistence.meili.selector | object | `{}` | Selector to match an existing Persistent Volume for WordPress data PVC If set, the PVC can't have a PV dynamically provisioned for it |
| persistence.meili.size | string | `"8Gi"` | Size of data volume |
| persistence.meili.storageClass | string | `""` | Storage class of backing PVC If defined, storageClassName: <storageClass> If set to "-", storageClassName: "", which disables dynamic provisioning If undefined (the default) or set to null, no storageClassName spec is   set, choosing the default provisioner.  (gp2 on AWS, standard on   GKE, AWS & OpenStack) |
| persistence.meili.subPath | string | `""` | The subdirectory of the volume to mount to, useful in dev environments and one PV for multiple services |
| redis.enabled | bool | `false` |  |
| saltRim.affinity | object | `{}` | Affinity for saltRim pods assignment ref: https://kubernetes.io/docs/concepts/configuration/assign-pod-node/#affinity-and-anti-affinity NOTE: `saltRim.podAffinityPreset`, `saltRim.podAntiAffinityPreset`, and `saltRim.nodeAffinityPreset` will be ignored when it's set |
| saltRim.annotations | object | `{}` | Annotations for saltRim ref: https://kubernetes.io/docs/concepts/overview/working-with-objects/annotations/ |
| saltRim.args | list | `[]` | Override default saltRim container args (useful when using custom images) |
| saltRim.automountServiceAccountToken | bool | `false` | Mount Service Account token in saltRim pods |
| saltRim.command | list | `[]` | Override default saltRim container command (useful when using custom images) |
| saltRim.containerPorts | list | `[{"containerPort":8080,"name":"http","protocol":"TCP"}]` | List of ports for saltRim containers |
| saltRim.containerSecurityContext.allowPrivilegeEscalation | bool | `false` | Set allowPrivilegeEscalation in saltRim container' Security Context |
| saltRim.containerSecurityContext.capabilities | object | `{"drop":["ALL"]}` | List of capabilities to be dropped in saltRim container |
| saltRim.containerSecurityContext.enabled | bool | `true` | Enabled saltRim container' Security Context |
| saltRim.containerSecurityContext.privileged | bool | `false` | Set privileged in saltRim container' Security Context |
| saltRim.containerSecurityContext.readOnlyRootFilesystem | bool | `true` | Set readOnlyRootFilesystem in saltRim container' Security Context |
| saltRim.containerSecurityContext.runAsGroup | int | `1001` |  |
| saltRim.containerSecurityContext.runAsNonRoot | bool | `true` | Set runAsNonRoot in saltRim container' Security Context |
| saltRim.containerSecurityContext.runAsUser | int | `1001` | Set runAsUser in saltRim container' Security Context |
| saltRim.containerSecurityContext.seLinuxOptions | object | `{}` | Set SELinux options in saltRim container |
| saltRim.containerSecurityContext.seccompProfile | object | `{"type":"RuntimeDefault"}` | Set seccomp profile in saltRim container |
| saltRim.customLivenessProbe | object | `{}` | Custom livenessProbe that overrides the default one |
| saltRim.customReadinessProbe | object | `{}` | Custom readinessProbe that overrides the default one |
| saltRim.customStartupProbe | object | `{}` | Custom startupProbe that overrides the default one |
| saltRim.extraEnvVars | list | `[]` | Array with extra environment variables to add to saltRim containers |
| saltRim.extraEnvVarsCM | string | `""` | Name of existing ConfigMap containing extra env vars for saltRim containers |
| saltRim.extraEnvVarsSecret | string | `""` | Name of existing Secret containing extra env vars for saltRim containers |
| saltRim.extraVolumeMounts | list | `[]` | Optionally specify extra list of additional volumeMounts for the saltRim containers |
| saltRim.extraVolumes | list | `[]` | Optionally specify extra list of additional volumes for the saltRim pods |
| saltRim.hostAliases | list | `[]` | saltRim pods host aliases ref: https://kubernetes.io/docs/concepts/services-networking/add-entries-to-pod-etc-hosts-with-host-aliases/ |
| saltRim.image.pullPolicy | string | `"IfNotPresent"` | The image pull policy ref: https://kubernetes.io/docs/concepts/containers/images/#pre-pulled-images |
| saltRim.image.pullSecrets | list | `[]` | Image pull secrets Secrets must be manually created in the namespace. ref: https://kubernetes.io/docs/tasks/configure-pod-container/pull-image-private-registry/ |
| saltRim.image.registry | string | `"docker.io"` | saltRim image registry |
| saltRim.image.repository | string | `"barassistant/salt-rim"` | saltRim image repository |
| saltRim.image.tag | string | `"v4"` | saltRim image tag |
| saltRim.initContainers | list | `[]` | Add additional init containers to the saltRim pods ref: https://kubernetes.io/docs/concepts/workloads/pods/init-containers/ |
| saltRim.livenessProbe.enabled | bool | `true` | Enable livenessProbe on saltRim containers |
| saltRim.livenessProbe.failureThreshold | int | `3` | Failure threshold for livenessProbe |
| saltRim.livenessProbe.httpGet.path | string | `"/"` |  |
| saltRim.livenessProbe.httpGet.port | string | `"http"` |  |
| saltRim.livenessProbe.initialDelaySeconds | int | `0` | Initial delay seconds for livenessProbe |
| saltRim.livenessProbe.periodSeconds | int | `10` | Period seconds for livenessProbe |
| saltRim.livenessProbe.successThreshold | int | `1` | Success threshold for livenessProbe |
| saltRim.livenessProbe.timeoutSeconds | int | `1` | Timeout seconds for livenessProbe |
| saltRim.nodeAffinityPreset.key | string | `""` | Node label key to match. Ignored if `saltRim.affinity` is set |
| saltRim.nodeAffinityPreset.type | string | `""` | Node affinity preset type. Ignored if `saltRim.affinity` is set. Allowed values: `soft` or `hard` |
| saltRim.nodeAffinityPreset.values | list | `[]` | Node label values to match. Ignored if `saltRim.affinity` is set |
| saltRim.nodeSelector | object | `{}` | Node labels for saltRim pods assignment ref: https://kubernetes.io/docs/concepts/scheduling-eviction/assign-pod-node/ |
| saltRim.podAffinityPreset | string | `""` | Pod affinity preset. Ignored if `saltRim.affinity` is set. Allowed values: `soft` or `hard` ref: https://kubernetes.io/docs/concepts/scheduling-eviction/assign-pod-node/#inter-pod-affinity-and-anti-affinity |
| saltRim.podAnnotations | object | `{}` | Annotations for saltRim pods ref: https://kubernetes.io/docs/concepts/overview/working-with-objects/annotations/ |
| saltRim.podAntiAffinityPreset | string | `"soft"` | Pod anti-affinity preset. Ignored if `saltRim.affinity` is set. Allowed values: `soft` or `hard` ref: https://kubernetes.io/docs/concepts/scheduling-eviction/assign-pod-node/#inter-pod-affinity-and-anti-affinity |
| saltRim.podLabels | object | `{}` | Extra labels for saltRim pods ref: https://kubernetes.io/docs/concepts/overview/working-with-objects/labels/ |
| saltRim.podSecurityContext.enabled | bool | `true` | Enable saltRim pods' Security Context |
| saltRim.podSecurityContext.fsGroup | int | `1001` | Set fsGroup in saltRim pods' Security Context |
| saltRim.podSecurityContext.fsGroupChangePolicy | string | `"Always"` | Set filesystem group change policy for saltRim pods |
| saltRim.podSecurityContext.supplementalGroups | list | `[]` | Set filesystem extra groups for saltRim pods |
| saltRim.podSecurityContext.sysctls | list | `[]` | settings using the sysctl interface for saltRim pods |
| saltRim.readinessProbe.enabled | bool | `true` | Enable readinessProbe on saltRim containers |
| saltRim.readinessProbe.failureThreshold | int | `3` | Failure threshold for readinessProbe |
| saltRim.readinessProbe.httpGet.path | string | `"/"` |  |
| saltRim.readinessProbe.httpGet.port | string | `"http"` |  |
| saltRim.readinessProbe.initialDelaySeconds | int | `0` | Initial delay seconds for readinessProbe |
| saltRim.readinessProbe.periodSeconds | int | `10` | Period seconds for readinessProbe |
| saltRim.readinessProbe.successThreshold | int | `1` | Success threshold for readinessProbe |
| saltRim.readinessProbe.timeoutSeconds | int | `1` | Timeout seconds for readinessProbe |
| saltRim.replicaCount | int | `1` | Number of saltRim replicas to deploy |
| saltRim.resources | object | `{}` | Set saltRim container requests and limits for different resources like CPU or memory (essential for production workloads) |
| saltRim.resourcesPreset | string | `"nano"` | Set saltRim container resources according to one common preset (allowed values: none, nano, small, medium, large, xlarge, 2xlarge). This is ignored if saltRim.resources is set (saltRim.resources is recommended for production). More information: https://github.com/bitnami/charts/blob/main/bitnami/common/templates/_resources.tpl#L15 |
| saltRim.sidecars | list | `[]` | Add additional sidecar containers to the saltRim pods |
| saltRim.startupProbe.enabled | bool | `false` | Enable startupProbe on saltRim containers |
| saltRim.startupProbe.failureThreshold | int | `3` | Failure threshold for startupProbe |
| saltRim.startupProbe.httpGet.path | string | `"/"` |  |
| saltRim.startupProbe.httpGet.port | string | `"http"` |  |
| saltRim.startupProbe.initialDelaySeconds | int | `0` | Initial delay seconds for startupProbe |
| saltRim.startupProbe.periodSeconds | int | `10` | Period seconds for startupProbe |
| saltRim.startupProbe.successThreshold | int | `1` | Success threshold for startupProbe |
| saltRim.startupProbe.timeoutSeconds | int | `1` | Timeout seconds for startupProbe |
| saltRim.terminationGracePeriodSeconds | string | `""` | Seconds saltRim pods need to terminate gracefully ref: https://kubernetes.io/docs/concepts/workloads/pods/pod/#termination-of-pods |
| saltRim.tolerations | list | `[]` | Tolerations for saltRim pods assignment ref: https://kubernetes.io/docs/concepts/configuration/taint-and-toleration/ |
| saltRim.updateStrategy | object | `{"type":"RollingUpdate"}` | Deployment strategy type ref: https://kubernetes.io/docs/concepts/workloads/controllers/deployment/#strategy |
| serviceAccount.annotations | object | `{}` | Additional Service Account annotations (evaluated as a template) |
| serviceAccount.automountServiceAccountToken | bool | `true` | Automount service account token for the server service account |
| serviceAccount.create | bool | `true` | Specifies whether a ServiceAccount should be created |
| serviceAccount.name | string | `""` | The name of the ServiceAccount to use. If not set and create is true, a name is generated using the common.names.fullname template |
| services.barAssistant.annotations | object | `{}` | Additional custom annotations for barAssistant service |
| services.barAssistant.clusterIP | string | `""` | barAssistant service Cluster IP |
| services.barAssistant.externalTrafficPolicy | string | `"Cluster"` | barAssistant service external traffic policy ref http://kubernetes.io/docs/tasks/access-application-cluster/create-external-load-balancer/#preserving-the-client-source-ip |
| services.barAssistant.extraPorts | list | `[]` | Extra ports to expose in barAssistant service (normally used with the `sidecars` value) |
| services.barAssistant.loadBalancerIP | string | `""` | barAssistant service Load Balancer IP ref: https://kubernetes.io/docs/concepts/services-networking/service/#type-loadbalancer |
| services.barAssistant.loadBalancerSourceRanges | list | `[]` | barAssistant service Load Balancer sources ref: https://kubernetes.io/docs/tasks/access-application-cluster/configure-cloud-provider-firewall/#restrict-access-for-loadbalancer-service |
| services.barAssistant.ports[0].name | string | `"http"` |  |
| services.barAssistant.ports[0].port | int | `8080` |  |
| services.barAssistant.ports[0].protocol | string | `"TCP"` |  |
| services.barAssistant.sessionAffinity | string | `"None"` | Control where client requests go, to the same pod or round-robin Values: ClientIP or None ref: https://kubernetes.io/docs/concepts/services-networking/service/ |
| services.barAssistant.sessionAffinityConfig | object | `{}` | Additional settings for the sessionAffinity |
| services.barAssistant.type | string | `"ClusterIP"` | The service type |
| services.meili.annotations | object | `{}` | Additional custom annotations for meili service |
| services.meili.clusterIP | string | `""` | meili service Cluster IP |
| services.meili.externalTrafficPolicy | string | `"Cluster"` | meili service external traffic policy ref http://kubernetes.io/docs/tasks/access-application-cluster/create-external-load-balancer/#preserving-the-client-source-ip |
| services.meili.extraPorts | list | `[]` | Extra ports to expose in meili service (normally used with the `sidecars` value) |
| services.meili.loadBalancerIP | string | `""` | meili service Load Balancer IP ref: https://kubernetes.io/docs/concepts/services-networking/service/#type-loadbalancer |
| services.meili.loadBalancerSourceRanges | list | `[]` | meili service Load Balancer sources ref: https://kubernetes.io/docs/tasks/access-application-cluster/configure-cloud-provider-firewall/#restrict-access-for-loadbalancer-service |
| services.meili.ports[0].name | string | `"http"` |  |
| services.meili.ports[0].port | int | `7700` |  |
| services.meili.ports[0].protocol | string | `"TCP"` |  |
| services.meili.sessionAffinity | string | `"None"` | Control where client requests go, to the same pod or round-robin Values: ClientIP or None ref: https://kubernetes.io/docs/concepts/services-networking/service/ |
| services.meili.sessionAffinityConfig | object | `{}` | Additional settings for the sessionAffinity |
| services.meili.type | string | `"ClusterIP"` | The service type |
| services.saltRim.annotations | object | `{}` | Additional custom annotations for saltRim service |
| services.saltRim.clusterIP | string | `""` | saltRim service Cluster IP |
| services.saltRim.externalTrafficPolicy | string | `"Cluster"` | saltRim service external traffic policy ref http://kubernetes.io/docs/tasks/access-application-cluster/create-external-load-balancer/#preserving-the-client-source-ip |
| services.saltRim.extraPorts | list | `[]` | Extra ports to expose in saltRim service (normally used with the `sidecars` value) |
| services.saltRim.loadBalancerIP | string | `""` | saltRim service Load Balancer IP ref: https://kubernetes.io/docs/concepts/services-networking/service/#type-loadbalancer |
| services.saltRim.loadBalancerSourceRanges | list | `[]` | saltRim service Load Balancer sources ref: https://kubernetes.io/docs/tasks/access-application-cluster/configure-cloud-provider-firewall/#restrict-access-for-loadbalancer-service |
| services.saltRim.ports[0].name | string | `"http"` |  |
| services.saltRim.ports[0].port | int | `8080` |  |
| services.saltRim.ports[0].protocol | string | `"TCP"` |  |
| services.saltRim.sessionAffinity | string | `"None"` | Control where client requests go, to the same pod or round-robin Values: ClientIP or None ref: https://kubernetes.io/docs/concepts/services-networking/service/ |
| services.saltRim.sessionAffinityConfig | object | `{}` | Additional settings for the sessionAffinity |
| services.saltRim.type | string | `"ClusterIP"` | The service type |
| smtp.auth.existingSecret | string | `""` | An existing secret containing the SMTP server username and password. |
| smtp.auth.password | string | `""` | The password for the SMTP server. |
| smtp.auth.username | string | `""` | The username for the SMTP server. |
| smtp.enabled | bool | `false` | Enable configuration of the SMTP secret |
| smtp.from.address | string | `""` | The email address from which emails will be sent. |
| smtp.from.name | string | `"Bar Assistant"` | The name associated with the email address from which emails will be sent. |
| smtp.host | string | `""` | The SMTP host. |
| smtp.port | int | `25` | The SMTP port. |
| smtp.secure | bool | `false` | Use TLS when connecting to the server, typically for port 465. |

