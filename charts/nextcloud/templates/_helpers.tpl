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
