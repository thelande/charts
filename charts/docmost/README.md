# docmost

![Version: 0.2.1](https://img.shields.io/badge/Version-0.2.1-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 0.8.4](https://img.shields.io/badge/AppVersion-0.8.4-informational?style=flat-square)

Docmost is an open-source collaborative wiki and documentation software. It is an open-source alternative to Confluence and Notion.

**Homepage:** <https://docmost.com/>

## Source Code

* <https://github.com/docmost/docmost>

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` |  |
| docmost.appUrl | string | `""` | docmost externally accessible URL |
| docmost.drawIO.url | string | `""` | Custom draw.io server url. |
| docmost.smtp.auth.existingSecret | string | `""` | An existing secret containing the SMTP server username and password. |
| docmost.smtp.auth.password | string | `""` | The password for the SMTP server. |
| docmost.smtp.auth.username | string | `""` | The username for the SMTP server. |
| docmost.smtp.enabled | bool | `false` | Should SMTP be enabled? |
| docmost.smtp.host | string | `""` | The SMTP server to use for sending emails. |
| docmost.smtp.mailFrom.address | string | `""` | The email address from which emails will be sent. |
| docmost.smtp.mailFrom.name | string | `"Docmost"` | The name associated with the email address from which emails will be sent. |
| docmost.smtp.port | int | `587` | The port to use for the SMTP server. |
| docmost.smtp.secure | bool | `false` | Use TLS when connecting to the server, typically for port 465. See nodemailer 'secure' for details |
| fullnameOverride | string | `""` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.repository | string | `"docmost/docmost"` |  |
| image.tag | string | `""` |  |
| imagePullSecrets | list | `[]` |  |
| ingress | object | `{"annotations":{},"className":"","enabled":false,"hosts":[{"host":"chart-example.local","paths":[{"path":"/","pathType":"ImplementationSpecific"}]}],"tls":[]}` | This block is for setting up the ingress for more information can be found here: https://kubernetes.io/docs/concepts/services-networking/ingress/ |
| livenessProbe | object | `{"httpGet":{"path":"/","port":"http"}}` | This is to setup the liveness and readiness probes more information can be found here: https://kubernetes.io/docs/tasks/configure-pod-container/configure-liveness-readiness-startup-probes/ |
| nameOverride | string | `""` |  |
| nodeSelector | object | `{}` |  |
| persistence | object | `{"accessModes":["ReadWriteOnce"],"enabled":false,"existingClaim":"","resources":{"requests":{"storage":"5Gi"}},"storageClassName":""}` | Persistence configuration |
| podAnnotations | object | `{}` | This is for setting Kubernetes Annotations to a Pod. For more information checkout: https://kubernetes.io/docs/concepts/overview/working-with-objects/annotations/ |
| podLabels | object | `{}` | This is for setting Kubernetes Labels to a Pod. For more information checkout: https://kubernetes.io/docs/concepts/overview/working-with-objects/labels/ |
| podSecurityContext | object | `{}` |  |
| postgres.appSecretName | string | `"postgres-cluster-app"` | PostgreSQL cluster details secret name |
| readinessProbe.httpGet.path | string | `"/"` |  |
| readinessProbe.httpGet.port | string | `"http"` |  |
| redis.url | string | `""` | Redis cluster URL |
| replicaCount | int | `1` | This will set the replicaset count more information can be found here: https://kubernetes.io/docs/concepts/workloads/controllers/replicaset/ |
| resources | object | `{}` |  |
| securityContext | object | `{}` |  |
| service.port | int | `3000` | This sets the ports more information can be found here: https://kubernetes.io/docs/concepts/services-networking/service/#field-spec-ports |
| service.type | string | `"ClusterIP"` | This sets the service type more information can be found here: https://kubernetes.io/docs/concepts/services-networking/service/#publishing-services-service-types |
| serviceAccount.annotations | object | `{}` | Annotations to add to the service account |
| serviceAccount.automount | bool | `true` | Automatically mount a ServiceAccount's API credentials? |
| serviceAccount.create | bool | `true` | Specifies whether a service account should be created |
| serviceAccount.name | string | `""` | The name of the service account to use. If not set and create is true, a name is generated using the fullname template |
| tolerations | list | `[]` |  |
| volumeMounts | list | `[]` | Additional volumeMounts on the output Deployment definition. |
| volumes | list | `[]` | Additional volumes on the output Deployment definition. |

