{{/*
Expand the name of the chart.
*/}}
{{- define "csmm.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "csmm.fullname" -}}
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
{{- define "csmm.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "csmm.labels" -}}
helm.sh/chart: {{ include "csmm.chart" . }}
{{ include "csmm.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{- define "csmm.workers.labels" -}}
helm.sh/chart: {{ include "csmm.chart" . }}
{{ include "csmm.workers.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "csmm.selectorLabels" -}}
app.kubernetes.io/name: {{ include "csmm.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "csmm.workers.selectorLabels" -}}
app.kubernetes.io/name: {{ include "csmm.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/component: workers
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "csmm.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "csmm.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}

{{/*
MySQL configuration values
*/}}
{{- define "csmm.mysql.host" -}}
{{ .Values.csmm.mysql.host | default ((cat (include "csmm.name" .) "-mariadb") | nospace) }}
{{- end }}

{{- define "csmm.mysql.port" -}}
{{ .Values.csmm.mysql.port | default "3306" }}
{{- end }}

{{- define "csmm.mysql.database" -}}
{{ .Values.csmm.mysql.database | default .Values.mariadb.auth.database }}
{{- end }}

{{- define "csmm.mysql.username" -}}
{{ .Values.csmm.mysql.username | default .Values.mariadb.auth.username }}
{{- end }}

{{/*
Redis configuration values
*/}}
{{- define "csmm.redis.host" -}}
{{ .Values.csmm.redis.host | default ((cat (include "csmm.name" .) "-redis-master") | nospace) }}
{{- end }}

{{- define "csmm.redis.port" -}}
{{ .Values.csmm.redis.port | default "6379" }}
{{- end }}
