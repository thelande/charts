{{/*
Copyright Thomas Helander. All Rights Reserved.
SPDX-License-Identifier: APACHE-2.0
*/}}

{{/*
Return the proper prusaExporter name
*/}}
{{- define "prusa-exporter.prusaExporter.fullname" -}}
{{ printf "%s-prusa-exporter" (include "common.names.fullname" .) | trunc 63 | trimSuffix "-" }}
{{- end -}}

{{/*
Return the proper prusaExporter image name
*/}}
{{- define "prusa-exporter.prusaExporter.image" -}}
{{ include "common.images.image" (dict "imageRoot" .Values.prusaExporter.image "global" .Values.global) }}
{{- end -}}


{{/*
Return the proper Docker Image Registry Secret Names
*/}}
{{- define "prusa-exporter.imagePullSecrets" -}}
{{- include "common.images.renderPullSecrets" (dict "images" (list .Values.prusaExporter.image) "context" $) -}}
{{- end -}}

{{/*
Create the name of the service account to use
*/}}
{{- define "prusa-exporter.serviceAccountName" -}}
{{- if .Values.serviceAccount.create -}}
    {{ default (include "common.names.fullname" .) .Values.serviceAccount.name }}
{{- else -}}
    {{ default "default" .Values.serviceAccount.name }}
{{- end -}}
{{- end -}}


{{/*
Compile all warnings into a single message.
*/}}
{{- define "prusa-exporter.validateValues" -}}
{{- $messages := list -}}
{{- $messages := without $messages "" -}}
{{- $message := join "\n" $messages -}}

{{- if $message -}}
{{-   printf "\nVALUES VALIDATION:\n%s" $message -}}
{{- end -}}
{{- end -}}
