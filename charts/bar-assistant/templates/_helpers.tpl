{{/*
Copyright Thomas Helander. All Rights Reserved.
SPDX-License-Identifier: APACHE-2.0
*/}}

{{/*
Return the proper bar-assistant name
*/}}
{{- define "bar-assistant.bar-assistant.fullname" -}}
{{ printf "%s-bar-assistant" (include "common.names.fullname" .) | trunc 63 | trimSuffix "-" }}
{{- end -}}

{{/*
Return the proper meili name
*/}}
{{- define "bar-assistant.meili.fullname" -}}
{{ printf "%s-meili" (include "common.names.fullname" .) | trunc 63 | trimSuffix "-" }}
{{- end -}}

{{/*
Return the proper salt-rim name
*/}}
{{- define "bar-assistant.salt-rim.fullname" -}}
{{ printf "%s-salt-rim" (include "common.names.fullname" .) | trunc 63 | trimSuffix "-" }}
{{- end -}}

{{/*
Return the proper bar-assistant image name
*/}}
{{- define "bar-assistant.bar-assistant.image" -}}
{{ include "common.images.image" (dict "imageRoot" .Values.barAssistant.image "global" .Values.global) }}
{{- end -}}

{{/*
Return the proper meili image name
*/}}
{{- define "bar-assistant.meili.image" -}}
{{ include "common.images.image" (dict "imageRoot" .Values.meili.image "global" .Values.global) }}
{{- end -}}

{{/*
Return the proper salt-rim image name
*/}}
{{- define "bar-assistant.salt-rim.image" -}}
{{ include "common.images.image" (dict "imageRoot" .Values.saltRim.image "global" .Values.global) }}
{{- end -}}

{{/*
Return the proper image name (for the init container volume-permissions image)
*/}}
{{- define "bar-assistant.bar-assistant.volumePermissions.image" -}}
{{- include "common.images.image" ( dict "imageRoot" .Values.barAssistant.volumePermissions.image "global" .Values.global ) -}}
{{- end -}}



{{/*
Return the proper Docker Image Registry Secret Names
*/}}
{{- define "bar-assistant.imagePullSecrets" -}}
{{- include "common.images.renderPullSecrets" (dict "images" (list .Values.barAssistant.image .Values.meili.image .Values.saltRim.image) "context" $) -}}
{{- end -}}

{{/*
Create the name of the service account to use
*/}}
{{- define "bar-assistant.serviceAccountName" -}}
{{- if .Values.serviceAccount.create -}}
    {{ default (include "common.names.fullname" .) .Values.serviceAccount.name }}
{{- else -}}
    {{ default "default" .Values.serviceAccount.name }}
{{- end -}}
{{- end -}}

{{/*
Return true if cert-manager required annotations for TLS signed certificates are set in the Ingress annotations
Ref: https://cert-manager.io/docs/usage/ingress/#supported-annotations
*/}}
{{- define "bar-assistant.ingress.salt-rim.certManagerRequest" -}}
{{ if or (hasKey . "cert-manager.io/cluster-issuer") (hasKey . "cert-manager.io/issuer") }}
    {{- true -}}
{{- end -}}
{{- end -}}

{{/*
Return true if cert-manager required annotations for TLS signed certificates are set in the Ingress annotations
Ref: https://cert-manager.io/docs/usage/ingress/#supported-annotations
*/}}
{{- define "bar-assistant.ingress.bar-assistant.certManagerRequest" -}}
{{ if or (hasKey . "cert-manager.io/cluster-issuer") (hasKey . "cert-manager.io/issuer") }}
    {{- true -}}
{{- end -}}
{{- end -}}


{{/*
Compile all warnings into a single message.
*/}}
{{- define "bar-assistant.validateValues" -}}
{{- $messages := list -}}
{{- $messages := without $messages "" -}}
{{- $message := join "\n" $messages -}}

{{- if $message -}}
{{-   printf "\nVALUES VALIDATION:\n%s" $message -}}
{{- end -}}
{{- end -}}
