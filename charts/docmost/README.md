# docmost

![Version: 0.5.0](https://img.shields.io/badge/Version-0.5.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 0.24.0](https://img.shields.io/badge/AppVersion-0.24.0-informational?style=flat-square)

Docmost is an open-source collaborative wiki and documentation software. It is an open-source alternative to Confluence and Notion.

**Homepage:** <https://docmost.com/>

## Source Code

* <https://github.com/docmost/docmost>
* <https://github.com/thelande/charts>

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` |  |
| docmost.appUrl | string | `""` | docmost externally accessible URL |
| docmost.databaseMaxPool | string | `""` | Database max pool size (default: 10) |
| docmost.debugMode | bool | `false` | Enable debug mode (default: false) |
| docmost.disableTelemetry | bool | `false` | Disable telemetry (default: false) |
| docmost.drawIO.url | string | `""` | Custom draw.io server url. |
| docmost.fileImportSizeLimit | string | `""` | File import size limit (e.g., "200mb") |
| docmost.fileUploadSizeLimit | string | `""` | File upload size limit (e.g., "50mb", "1gb") |
| docmost.jwtTokenExpiresIn | string | `""` | JWT token expiration (default: "90d") |
| docmost.oidc.autoRedirect | bool | `false` | Auto-redirect to OIDC when SSO is enforced (default: false) |
| docmost.oidc.buttonText | string | `""` | OIDC button text (default: "Sign in with SSO") |
| docmost.port | string | `""` | Application port (default: 3000) |
| docmost.posthogHost | string | `""` | PostHog analytics host |
| docmost.posthogKey | string | `""` | PostHog analytics key |
| docmost.postmark.token | string | `""` | Postmark API token (alternative to SMTP) |
| docmost.smtp.auth.existingSecret | string | `""` | An existing secret containing the SMTP server username and password. |
| docmost.smtp.auth.password | string | `""` | The password for the SMTP server. |
| docmost.smtp.auth.username | string | `""` | The username for the SMTP server. |
| docmost.smtp.enabled | bool | `false` | Should SMTP be enabled? |
| docmost.smtp.host | string | `""` | The SMTP server to use for sending emails. |
| docmost.smtp.ignoreTls | bool | `false` | SMTP ignore TLS (default: false) |
| docmost.smtp.mailFrom.address | string | `""` | The email address from which emails will be sent. |
| docmost.smtp.mailFrom.name | string | `"Docmost"` | The name associated with the email address from which emails will be sent. |
| docmost.smtp.port | int | `587` | The port to use for the SMTP server. |
| docmost.smtp.secure | bool | `false` | Use TLS when connecting to the server, typically for port 465. See nodemailer 'secure' for details |
| docmost.storage.driver | string | `""` | Storage driver (local or s3) |
| docmost.storage.s3.accessKeyId | string | `""` | AWS access key ID (if not using existingSecret) |
| docmost.storage.s3.bucket | string | `""` | S3 bucket name |
| docmost.storage.s3.endpoint | string | `""` | S3 endpoint URL |
| docmost.storage.s3.existingSecret | string | `""` | Existing secret containing AWS credentials (access-key-id, secret-access-key) |
| docmost.storage.s3.forcePathStyle | string | `""` | Force path style (true/false) |
| docmost.storage.s3.region | string | `""` | AWS S3 region |
| docmost.storage.s3.secretAccessKey | string | `""` | AWS secret access key (if not using existingSecret) |
| docmost.storage.s3.url | string | `""` | S3 public URL |
| extraEnv | list | `[]` | Additional environment variables (name/value pairs) |
| extraEnvFrom | list | `[]` | Additional environment variables from secrets or configmaps |
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
| postgres.extraParams | string | `""` | Additional PostgreSQL connection parameters (e.g., "&connect_timeout=10") |
| postgres.sslMode | string | `""` | PostgreSQL SSL mode (e.g., "&sslmode=require", "&sslmode=verify-full") |
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

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.14.2](https://github.com/norwoodj/helm-docs/releases/v1.14.2)
