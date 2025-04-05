{{/*
Expand the name of the chart.
*/}}
{{- define "nextcloud.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "nextcloud.fullname" -}}
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
{{- define "nextcloud.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "nextcloud.labels" -}}
helm.sh/chart: {{ include "nextcloud.chart" . }}
{{ include "nextcloud.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "nextcloud.selectorLabels" -}}
app.kubernetes.io/name: {{ include "nextcloud.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "nextcloud.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "nextcloud.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}

{{/*
Name of the secret containing the admin user credentials.
*/}}
{{- define "nextcloud.auth.secretName" -}}
{{ default (printf "%s-admin" (include "nextcloud.fullname" .)) .Values.nextcloud.auth.existingSecret }}
{{- end }}

{{/*
Name of the secret containing the redis password.
*/}}
{{- define "nextcloud.redis.secretName" -}}
{{ default (printf "%s-redis-password" (include "nextcloud.fullname" .)) .Values.nextcloud.redis.existingSecret }}
{{- end }}

{{/*
Name of the secret containing the smtp credentials.
*/}}
{{- define "nextcloud.smtp.secretName" -}}
{{ default (printf "%s-smtp-creds" (include "nextcloud.fullname" .)) .Values.nextcloud.smtp.existingSecret }}
{{- end }}

{{- define "nextcloud.env" -}}
{{- with .Values.nextcloud.database }}
{{- if eq .type "postgres" }}
- name: POSTGRES_DB_FILE
  value: /config/database/dbname
- name: POSTGRES_USER_FILE
  value: /config/database/username
- name: POSTGRES_PASSWORD_FILE
  value: /config/database/password
- name: POSTGRES_HOST
  valueFrom:
    secretKeyRef:
      name: {{ .existingSecret }}
      key: host
{{- else if eq .type "mysql" }}
- name: MYSQL_DB_FILE
  value: /config/database/dbname
- name: MYSQL_USER_FILE
  value: /config/database/username
- name: MYSQL_PASSWORD_FILE
  value: /config/database/password
- name: MYSQL_HOST
  valueFrom:
    secretKeyRef:
      name: {{ .existingSecret }}
      key: host
{{- else }}
{{- fail printf "Invalid database type: %s" .type }}
{{- end }}
{{- end }}{{/* with .Values.nextcloud.database */}}
- name: NEXTCLOUD_ADMIN_USER_FILE
  value: /config/auth/username
- name: NEXTCLOUD_ADMIN_PASSWORD_FILE
  value: /config/auth/password
- name: NEXTCLOUD_DATA_DIR
  value: {{ .Values.nextcloud.dataDir | quote }}
{{- if .Values.nextcloud.trustedDomains }}
- name: NEXTCLOUD_TRUSTED_DOMAINS
  value: {{ join " " .Values.nextcloud.trustedDomains | quote }}
{{- end }}
{{- if .Values.nextcloud.trustedProxies }}
- name: TRUSTED_PROXIES
  value: {{ join " " .Values.nextcloud.trustedProxies | quote }}
{{- end }}
{{- if .Values.nextcloud.redis.enabled }}
{{- with .Values.nextcloud.redis }}
- name: REDIS_HOST
  value: {{ .host | quote }}
- name: REDIS_HOST_PORT
  value: {{ .port | quote }}
{{- end }}{{/* with .Values.nextcloud.redis */}}
{{- if or .Values.nextcloud.redis.password .Values.nextcloud.redis.existingSecret }}
- name: REDIS_HOST_PASSWORD
  valueFrom:
    secretKeyRef:
      name: {{ include "nextcloud.redis.secretName" . }}
      key: password
{{- end }}{{/* if or .Values.nextcloud.redis.password .Values.nextcloud.redis.existingSecret */}}
{{- end }}{{/* if .Values.nextcloud.redis.enabled */}}
{{- if .Values.nextcloud.smtp.enabled }}
{{- with .Values.nextcloud.smtp }}
- name: SMTP_HOST
  value: {{ .host | quote }}
{{- if .secure }}
- name: SMTP_SECURE
  value: {{ .secure | quote }}
{{- end }}
- name: SMTP_PORT
  value: {{ .port | quote }}
- name: SMTP_AUTHTYPE
  value: {{ .authType | quote }}
{{- if .fromAddress }}
- name: MAIL_FROM_ADDRESS
  value: {{ .fromAddress | quote }}
{{- end }}
{{- if .domain }}
- name: MAIL_DOMAIN
  value: {{ .domain | quote }}
{{- end }}
{{- end }}{{/* with .Values.nextcloud.smtp */}}
- name: SMTP_NAME
  valueFrom:
    secretKeyRef:
      name: {{ include "nextcloud.smtp.secretName" . }}
      key: username
- name: SMTP_PASSWORD
  valueFrom:
    secretKeyRef:
      name: {{ include "nextcloud.smtp.secretName" . }}
      key: password
{{- end }}{{/* if .Values.nextcloud.smtp.enabled */}}
{{- if .Values.nextcloud.php.memoryLimit }}
- name: PHP_MEMORY_LIMIT
  value: {{ .Values.nextcloud.php.memoryLimit | quote }}
{{- end }}
{{- if .Values.nextcloud.php.uploadLimit }}
- name: PHP_UPLOAD_LIMIT
  value: {{ .Values.nextcloud.php.uploadLimit | quote }}
{{- end }}
{{- end }}