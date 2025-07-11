{{/*
Expand the name of the chart.
*/}}
{{- define "mealie.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "mealie.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "mealie.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "mealie.labels" -}}
helm.sh/chart: {{ include "mealie.chart" . }}
{{ include "mealie.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "mealie.selectorLabels" -}}
app.kubernetes.io/name: {{ include "mealie.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "mealie.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "mealie.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}

{{/*
Return the database secret name
*/}}
{{- define "mealie.databaseSecretName" -}}
{{- default (printf "%s-externaldb" (include "common.names.fullname" .)) (tpl .Values.mealie.postgresql.existingSecret $) -}}
{{- end }}

{{/*
Return the SMTP auth secret name
*/}}
{{- define "mealie.smtpAuthSecretName" -}}
{{- default (printf "%s-smtp-auth" (include "common.names.fullname" .)) (tpl .Values.mealie.smtp.auth.existingSecret $) -}}
{{- end }}

{{/*
Return the LDAP Bind secret name
*/}}
{{- define "mealie.ldapBindSecretName" -}}
{{- default (printf "%s-ldap" (include "common.names.fullname" .)) (tpl .Values.mealie.ldap.bind.existingSecret $) -}}
{{- end }}

{{/*
Return the OIDC client secret name
*/}}
{{- define "mealie.oidcClientSecretName" -}}
{{- default (printf "%s-oidc" (include "common.names.fullname" .)) (tpl .Values.mealie.oidc.client.existingSecret $) -}}
{{- end }}

{{/*
Name of the persistent volume claim
*/}}
{{- define "mealie.persistence.existingClaim" -}}
{{ default (printf "%s-data" (include "common.names.fullname" .)) .Values.mealie.persistence.existingClaim }}
{{- end }}

{{/*
Environment variables
*/}}
{{- define "mealie.env" -}}
{{- /* General configuration */}}
- name: TZ
  value: {{ .Values.timezone | quote }}
{{- with .Values.mealie }}
- name: DEFAULT_GROUP
  value: {{ .defaultGroup | quote }}
- name: DEFAULT_HOUSEHOLD
  value: {{ .defaultHousehold | quote }}
- name: BASE_URL
  value: {{ .baseURL | quote }}
- name: TOKEN_TIME
  value: {{ .tokenTime | quote }}
- name: API_DOCS
  value: {{ .enableAPIDocs | quote }}
- name: ALLOW_SIGNUP
  value: {{ .allowSignup | quote }}
- name: DAILY_SCHEDULE_TIME
  value: {{ .dailyScheduleTime | quote }}

{{- /* Security configuration */}}
- name: SECURITY_MAX_LOGIN_ATTEMPTS
  value: {{ .security.maxLoginAttempts | quote }}
- name: SECURITY_USER_LOCKOUT_TIME
  value: {{ .security.userLockoutTime | quote }}

{{- /* Database configuration */}}
- name: DB_ENGINE
  value: postgres
- name: POSTGRES_USER
  valueFrom:
    secretKeyRef:
      name: {{ include "mealie.databaseSecretName" $ }}
      key: username
- name: POSTGRES_PASSWORD
  valueFrom:
    secretKeyRef:
      name: {{ include "mealie.databaseSecretName" $ }}
      key: password
- name: POSTGRES_SERVER
  valueFrom:
    secretKeyRef:
      name: {{ include "mealie.databaseSecretName" $ }}
      key: host
- name: POSTGRES_PORT
  valueFrom:
    secretKeyRef:
      name: {{ include "mealie.databaseSecretName" $ }}
      key: port
- name: POSTGRES_DB
  valueFrom:
    secretKeyRef:
      name: {{ include "mealie.databaseSecretName" $ }}
      key: dbname

{{- /* Email configuration */}}
{{- if .smtp.enabled }}
- name: SMTP_HOST
  value: {{ .smtp.host | quote }}
- name: SMTP_PORT
  value: {{ .smtp.port | quote }}
- name: SMTP_FROM_NAME
  value: {{ .smtp.mailFrom.name | quote }}
- name: SMTP_FROM_EMAIL
  value: {{ .smtp.mailFrom.address | quote }}
- name: SMTP_AUTH_STRATEGY
  value: {{ ternary "TLS" "NONE" .smtp.secure }}
- name: SMTP_USER
  valueFrom:
    secretKeyRef:
      name: {{ include "mealie.smtpAuthSecretName" $ }}
      key: username
- name: SMTP_PASSWORD
  valueFrom:
    secretKeyRef:
      name: {{ include "mealie.smtpAuthSecretName" $ }}
      key: password
{{- end }}

{{- /* LDAP configuration */}}
{{- if .ldap.enabled }}
- name: LDAP_AUTH_ENABLED
  value: {{ .ldap.enabled | quote }}
- name: LDAP_SERVER_URL
  value: {{ .ldap.url | quote }}
- name: LDAP_TLS_INSECURE
  value: {{ .ldap.sslInsecure | quote }}
- name: LDAP_TLS_CACERTFILE
  value: {{ .ldap.caCertFile | quote }}
- name: LDAP_ENABLE_STARTTLS
  value: {{ .ldap.enableStartTLS | quote }}
- name: LDAP_BASE_DN
  value: {{ .ldap.baseDN | quote }}
{{- if .ldap.bind.enabled }}
- name: LDAP_QUERY_BIND
  valueFrom:
    secretKeyRef:
      name: {{ include "mealie.ldapBindSecretName" $ }}
      key: username
- name: LDAP_QUERY_PASSWORD
  valueFrom:
    secretKeyRef:
      name: {{ include "mealie.ldapBindSecretName" $ }}
      key: password
{{- end }}{{/* if .ldap.bind.enabled */}}
- name: LDAP_USER_FILTER
  value: {{ .ldap.userFilter | quote }}
- name: LDAP_ADMIN_FILTER
  value: {{ .ldap.adminFilter | quote }}
- name: LDAP_ID_ATTRIBUTE
  value: {{ .ldap.idAttribute | quote }}
- name: LDAP_NAME_ATTRIBUTE
  value: {{ .ldap.nameAttribute | quote }}
- name: LDAP_MAIL_ATTRIBUTE
  value: {{ .ldap.mailAttribute | quote }}
{{- end }}{{/* if .ldap.enabled */}}

{{- /* OIDC configuration */}}
{{- if .oidc.enabled }}
- name: OIDC_AUTH_ENABLED
  value: {{ .oidc.enabled | quote }}
- name: OIDC_SIGNUP_ENABLED
  value: {{ .oidc.signupEnabled | quote }}
- name: OIDC_CONFIGURATION_URL
  value: {{ .oidc.configurationURL | quote }}
- name: OIDC_CLIENT_ID
  valueFrom:
    secretKeyRef:
      name: {{ include "mealie.oidcClientSecretName" $ }}
      key: clientID
- name: OIDC_CLIENT_SECRET
  valueFrom:
    secretKeyRef:
      name: {{ include "mealie.oidcClientSecretName" $ }}
      key: clientSecret
- name: OIDC_USER_GROUP
  value: {{ .oidc.userGroup | quote }}
- name: OIDC_ADMIN_GROUP
  value: {{ .oidc.adminGroup | quote }}
- name: OIDC_AUTO_REDIRECT
  value: {{ .oidc.autoRedirect | quote }}
- name: OIDC_PROVIDER_NAME
  value: {{ .oidc.providerName | quote }}
- name: OIDC_REMEMBER_ME
  value: {{ .oidc.rememberMe | quote }}
- name: OIDC_SIGNING_ALGORITHM
  value: {{ .oidc.signingAlgorithm | quote }}
- name: OIDC_USER_CLAIM
  value: {{ .oidc.userClaim | quote }}
- name: OIDC_NAME_CLAIM
  value: {{ .oidc.nameClaim | quote }}
- name: OIDC_GROUPS_CLAIM
  value: {{ .oidc.groupsClaim | quote }}
- name: OIDC_SCOPES_OVERRIDE
  value: {{ .oidc.scopesOverride | quote }}
- name: OIDC_TLS_CACERTFILE
  value: {{ .oidc.tlsCACertFile | quote }}
- name: ALLOW_PASSWORD_LOGIN
  value: "false"
{{- end }}{{/* if .oidc.enabled */}}
{{- end }}
{{- end }}
