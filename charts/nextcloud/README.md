# nextcloud

![Version: 0.1.10](https://img.shields.io/badge/Version-0.1.10-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 31.0.0](https://img.shields.io/badge/AppVersion-31.0.0-informational?style=flat-square)

Nextcloud server, a safe home for all your data

**Homepage:** <https://nextcloud.com/>

## Source Code

* <https://github.com/nextcloud/server>
* <https://github.com/nextcloud/docker>

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` |  |
| env | object | `{}` |  |
| fullnameOverride | string | `""` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.repository | string | `"nextcloud"` |  |
| image.tag | string | `""` |  |
| imagePullSecrets | list | `[]` |  |
| ingress.annotations | object | `{}` |  |
| ingress.className | string | `""` |  |
| ingress.enabled | bool | `false` |  |
| ingress.hosts[0].host | string | `"chart-example.local"` |  |
| ingress.hosts[0].paths[0].path | string | `"/"` |  |
| ingress.hosts[0].paths[0].pathType | string | `"ImplementationSpecific"` |  |
| ingress.tls | list | `[]` |  |
| livenessProbe.httpGet.path | string | `"/status.php"` |  |
| livenessProbe.httpGet.port | string | `"http"` |  |
| livenessProbe.periodSeconds | string | `"60s"` |  |
| livenessProbe.timeoutSeconds | string | `"10s"` |  |
| nameOverride | string | `""` |  |
| nextcloud.auth.existingSecret | string | `""` | Secret containing the admin username and password. |
| nextcloud.auth.password | string | `"nextcloud"` | Password for the Nextcloud admin user. Ignored if existingSecret is set. |
| nextcloud.auth.username | string | `"admin"` | Name of the Nextcloud admin user. Ignored if existingSecret is set. |
| nextcloud.dataDir | string | `"/var/www/html/data"` | Configures the data directory where nextcloud stores all files from the users. |
| nextcloud.database.existingSecret | string | `""` | The existing secret containing the database connection details. Must have the following keys: host, username, password, and dbname. |
| nextcloud.database.type | string | `"postgres"` | The type of database to use. Either postgres or mysql. The database must created manually and is not handled by this chart. |
| nextcloud.php.memoryLimit | string | `""` | This sets the maximum amount of memory in bytes that a script is allowed to allocate. This is meant to help prevent poorly written scripts from eating up all available memory but it can prevent normal operation if set too tight. |
| nextcloud.php.uploadLimit | string | `""` | This sets the upload limit (post_max_size and upload_max_filesize) for big files. Note that you may have to change other limits depending on your client, webserver or operating system. Check the Nextcloud documentation⁠ for more information. The ingress proxy limit must also be increased when using an ingress to access nextcloud (e.g., nginx.ingress.kubernetes.io/proxy-body-size). |
| nextcloud.redis.enabled | bool | `false` | Should redis caching be used. |
| nextcloud.redis.existingSecret | string | `""` | The existing secret containing the redis password. |
| nextcloud.redis.host | string | `"redis"` | Hostname of the redis service to use. |
| nextcloud.redis.password | string | `""` | Redis password. Ignored if existingSecret is set. |
| nextcloud.redis.port | int | `6379` | Optional port for Redis, only use for external Redis servers that run on non-standard ports. |
| nextcloud.smtp.authType | string | `"LOGIN"` |  |
| nextcloud.smtp.domain | string | `""` | Set a different domain for the emails than the domain where Nextcloud is installed. |
| nextcloud.smtp.enabled | bool | `false` | Enable external SMTP access. |
| nextcloud.smtp.existingSecret | string | `""` | Existing secret containing the SMTP server username and password. Must have the following keys: username and password. |
| nextcloud.smtp.fromAddress | string | `""` | Set the local-part for the 'from' field in the emails sent by Nextcloud. |
| nextcloud.smtp.host | string | `""` | The hostname of the SMTP server. |
| nextcloud.smtp.password | string | `""` | The password for the authentication. Ignored if existingSecret is set. |
| nextcloud.smtp.port | int | `25` | Port for the SMTP connection. Use 465 for SSL or 587 for STARTTLS. |
| nextcloud.smtp.secure | string | `""` | Set to ssl to use SSL, or tls to use STARTTLS. |
| nextcloud.smtp.username | string | `""` | The username for the authentication. Ignored if existingSecret is set. |
| nextcloud.trustedDomains | list | `[]` | Optional list of trusted domains. |
| nodeSelector | object | `{}` |  |
| persistence.accessModes[0] | string | `"ReadWriteOnce"` |  |
| persistence.enabled | bool | `false` |  |
| persistence.resources.requests.storage | string | `"5Gi"` |  |
| persistence.storageClassName | string | `""` |  |
| podAnnotations | object | `{}` |  |
| podLabels | object | `{}` |  |
| podSecurityContext | object | `{}` |  |
| readinessProbe.httpGet.path | string | `"/status.php"` |  |
| readinessProbe.httpGet.port | string | `"http"` |  |
| readinessProbe.periodSeconds | string | `"60s"` |  |
| readinessProbe.timeoutSeconds | string | `"10s"` |  |
| replicaCount | int | `1` |  |
| resources | object | `{}` |  |
| securityContext | object | `{}` |  |
| service.port | int | `80` |  |
| service.type | string | `"ClusterIP"` |  |
| serviceAccount.annotations | object | `{}` |  |
| serviceAccount.automount | bool | `true` |  |
| serviceAccount.create | bool | `true` |  |
| serviceAccount.name | string | `""` |  |
| tolerations | list | `[]` |  |
| volumeMounts | list | `[]` |  |
| volumes | list | `[]` |  |

