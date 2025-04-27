# mealie

![Version: 0.1.2](https://img.shields.io/badge/Version-0.1.2-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: v2.8.0](https://img.shields.io/badge/AppVersion-v2.8.0-informational?style=flat-square)

A self-hosted recipe manager and meal planner with a RestAPI backend and a reactive frontend application built in Vue for a pleasant user experience for the whole family.

**Homepage:** <https://mealie.io/>

## Source Code

* <https://github.com/mealie-recipes/mealie/>
* <https://github.com/thelande/charts/>

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| oci://registry-1.docker.io/bitnamicharts | common | 2.x.x |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` |  |
| commonAnnotations | object | `{}` |  |
| commonLabels | object | `{}` |  |
| fullnameOverride | string | `""` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.repository | string | `"ghcr.io/mealie-recipes/mealie"` |  |
| image.tag | string | `""` |  |
| imagePullSecrets | list | `[]` |  |
| ingress.annotations | object | `{}` |  |
| ingress.className | string | `""` |  |
| ingress.enabled | bool | `false` |  |
| ingress.hosts[0].host | string | `"chart-example.local"` |  |
| ingress.hosts[0].paths[0].path | string | `"/"` |  |
| ingress.hosts[0].paths[0].pathType | string | `"ImplementationSpecific"` |  |
| ingress.tls | list | `[]` |  |
| livenessProbe.httpGet.path | string | `"/"` |  |
| livenessProbe.httpGet.port | string | `"http"` |  |
| mealie.allowSignup | bool | `false` | Allow user sign-up without token |
| mealie.baseURL | string | `"http://mealie.local"` | Used for notifications |
| mealie.dailyScheduleTime | string | `"23:45"` | The time of day to run daily server tasks, in HH:MM format. Use the server's local time, not UTC |
| mealie.defaultGroup | string | `"Home"` | The default group for users |
| mealie.defaultHousehold | string | `"Family"` | The default household for users in each group |
| mealie.enableAPIDocs | bool | `false` | Turns on/off access to the API documentation locally |
| mealie.ldap.adminFilter | string | `""` | Optional LDAP filter, which tells Mealie the LDAP user is an admin (e.g. (memberOf=cn=admins,dc=example,dc=com)) |
| mealie.ldap.baseDN | string | `""` | Starting point when searching for users authentication (e.g. CN=Users,DC=xx,DC=yy,DC=de) |
| mealie.ldap.bind.enabled | bool | `false` | Should Mealie bind to the LDAP server for queries. |
| mealie.ldap.bind.existingSecret | string | `""` | Existing secret with the ldap bind credentials (keys should be "username" and "password"). |
| mealie.ldap.bind.password | string | `""` | Optional password for the bind user used in queryBind |
| mealie.ldap.bind.username | string | `""` | Optional bind user for LDAP search queries (e.g. cn=admin,cn=users,dc=example,dc=com). If None then anonymous bind will be used. |
| mealie.ldap.caCertFile | string | `""` | File path to Certificate Authority used to verify server certificate (e.g. /path/to/ca.crt) |
| mealie.ldap.enableStartTLS | bool | `false` | Use STARTTLS to connect to the server |
| mealie.ldap.enabled | bool | `false` | Authenticate via an external LDAP server in addidion to built-in Mealie auth |
| mealie.ldap.idAttribute | string | `"uid"` | The LDAP attribute that maps to the user's id |
| mealie.ldap.mailAttribute | string | `"mail"` | The LDAP attribute that maps to the user's email |
| mealie.ldap.nameAttribute | string | `"name"` | The LDAP attribute that maps to the user's name |
| mealie.ldap.sslInsecure | bool | `false` | Do not verify server certificate when using secure LDAP |
| mealie.ldap.url | string | `""` | LDAP server URL (e.g. ldap://ldap.example.com) |
| mealie.ldap.userFilter | string | `""` | Optional LDAP filter to narrow down eligible users (e.g. (memberOf=cn=mealie_user,dc=example,dc=com)) |
| mealie.oidc.adminGroup | string | `""` | If specified, users belonging to this group will be made an admin. For more information see https://docs.mealie.io/documentation/getting-started/authentication/oidc/#groups |
| mealie.oidc.autoRedirect | bool | `false` | If True, then the login page will be bypassed an you will be sent directly to your Identity Provider. You can still get to the login page by adding ?direct=1 to the login URL |
| mealie.oidc.client.existingSecret | string | `""` | Existing secret containing the client ID and secret (keys should be clientID and clientSecret) |
| mealie.oidc.client.id | string | `""` | The client id of your configured client in your provider |
| mealie.oidc.client.secret | string | `""` | The client secret of your configured client in your provider |
| mealie.oidc.configurationURL | string | `""` | The URL to the OIDC configuration of your provider. This is usually something like https://auth.example.com/.well-known/openid-configuration |
| mealie.oidc.enabled | bool | `false` | Enables authentication via OpenID Connect |
| mealie.oidc.groupsClaim | string | `"groups"` | Optional if not using OIDC_USER_GROUP or OIDC_ADMIN_GROUP. This is the claim Mealie will request from your IdP and will use to compare to OIDC_USER_GROUP or OIDC_ADMIN_GROUP to allow the user to log in to Mealie or is set as an admin. Your IdP must be configured to grant this claim |
| mealie.oidc.nameClaim | string | `"name"` | This is the claim which Mealie will use for the users Full Name |
| mealie.oidc.providerName | string | `"OAuth"` | The provider name is shown in SSO login button. "Login with <OIDC_PROVIDER_NAME>" |
| mealie.oidc.rememberMe | bool | `false` | Because redirects bypass the login screen, you cant extend your session by clicking the "Remember Me" checkbox. By setting this value to true, a session will be extended as if "Remember Me" was checked |
| mealie.oidc.scopesOverride | string | `""` | Advanced configuration used to override the scopes requested from the IdP. Most users won't need to change this. At a minimum, 'openid profile email' are required. |
| mealie.oidc.signingAlgorithm | string | `"RS256"` | The algorithm used to sign the id token (examples: RS256, HS256) |
| mealie.oidc.signupEnabled | bool | `true` | Enables new users to be created when signing in for the first time with OIDC |
| mealie.oidc.tlsCACertFile | string | `""` | File path to Certificate Authority used to verify server certificate (e.g. /path/to/ca.crt) |
| mealie.oidc.userClaim | string | `"email"` | This is the claim which Mealie will use to look up an existing user by (e.g. "email", "preferred_username") |
| mealie.oidc.userGroup | string | `""` | If specified, only users belonging to this group will be able to successfully authenticate, regardless of the OIDC_ADMIN_GROUP. For more information see https://docs.mealie.io/documentation/getting-started/authentication/oidc/#groups |
| mealie.openAI | object | `{}` |  |
| mealie.postgresql.database | string | `"mealie"` | Name of the postgres database |
| mealie.postgresql.existingSecret | string | `""` | Name of existing secret containing the PostgreSQL cluster details |
| mealie.postgresql.host | string | `"postgres-rw"` | Name of the postgres host |
| mealie.postgresql.password | string | `"mealie"` | Password for the postgres user |
| mealie.postgresql.port | int | `5432` | Port for the postgres host |
| mealie.postgresql.user | string | `"mealie"` | User to connect as to the postgres database |
| mealie.security.maxLoginAttempts | int | `5` | Maximum times a user can provide an invalid password before their account is locked |
| mealie.security.userLockoutTime | int | `24` | Time in hours for how long a users account is locked |
| mealie.smtp.auth.existingSecret | string | `""` | An existing secret containing the SMTP server username and password. |
| mealie.smtp.auth.password | string | `""` | The password for the SMTP server. |
| mealie.smtp.auth.username | string | `""` | The username for the SMTP server. |
| mealie.smtp.enabled | bool | `false` | Should SMTP be enabled? |
| mealie.smtp.host | string | `""` | The SMTP server to use for sending emails. |
| mealie.smtp.mailFrom.address | string | `""` | The email address from which emails will be sent. |
| mealie.smtp.mailFrom.name | string | `"Mealie"` | The name associated with the email address from which emails will be sent. |
| mealie.smtp.port | int | `587` | The port to use for the SMTP server. |
| mealie.smtp.secure | bool | `false` | Use TLS when connecting to the server, typically for port 465. |
| mealie.theming | object | `{}` |  |
| mealie.tokenTime | int | `48` | The time in hours that a login/auth token is valid |
| nameOverride | string | `""` |  |
| nodeAffinityPreset.key | string | `""` |  |
| nodeAffinityPreset.type | string | `""` |  |
| nodeAffinityPreset.values | list | `[]` |  |
| nodeSelector | object | `{}` |  |
| podAffinityPreset | string | `""` |  |
| podAnnotations | object | `{}` |  |
| podAntiAffinityPreset | string | `"soft"` |  |
| podLabels | object | `{}` |  |
| podSecurityContext | object | `{}` |  |
| readinessProbe.httpGet.path | string | `"/"` |  |
| readinessProbe.httpGet.port | string | `"http"` |  |
| replicaCount | int | `1` |  |
| resources | object | `{}` |  |
| securityContext | object | `{}` |  |
| service.port | int | `9000` |  |
| service.type | string | `"ClusterIP"` |  |
| serviceAccount.annotations | object | `{}` |  |
| serviceAccount.automount | bool | `true` |  |
| serviceAccount.create | bool | `true` |  |
| serviceAccount.name | string | `""` |  |
| timezone | string | `"UTC"` |  |
| tolerations | list | `[]` |  |
| updateStrategy | object | `{}` |  |
| volumeMounts | list | `[]` |  |
| volumes | list | `[]` |  |

