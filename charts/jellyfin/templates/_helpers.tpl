{{/*
Copyright Thomas Helander. All Rights Reserved.
SPDX-License-Identifier: APACHE-2.0
*/}}

{{/*
Return the proper jellyfin name
*/}}
{{- define "jellyfin.jellyfin.fullname" -}}
{{ printf "%s-jellyfin" (include "common.names.fullname" .) | trunc 63 | trimSuffix "-" }}
{{- end -}}

{{/*
Return the proper jellyfin image name
*/}}
{{- define "jellyfin.jellyfin.image" -}}
{{ include "common.images.image" (dict "imageRoot" .Values.jellyfin.image "global" .Values.global) }}
{{- end -}}

{{/*
Return the proper Docker Image Registry Secret Names
*/}}
{{- define "jellyfin.imagePullSecrets" -}}
{{- include "common.images.renderPullSecrets" (dict "images" (list .Values.jellyfin.image) "context" $) -}}
{{- end -}}

{{/*
Create the name of the service account to use
*/}}
{{- define "jellyfin.serviceAccountName" -}}
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
{{- define "jellyfin.ingress.jellyfin.certManagerRequest" -}}
{{ if or (hasKey . "cert-manager.io/cluster-issuer") (hasKey . "cert-manager.io/issuer") }}
    {{- true -}}
{{- end -}}
{{- end -}}


{{/*
Compile all warnings into a single message.
*/}}
{{- define "jellyfin.validateValues" -}}
{{- $messages := list -}}
{{- $messages := without $messages "" -}}
{{- $message := join "\n" $messages -}}

{{- if $message -}}
{{-   printf "\nVALUES VALIDATION:\n%s" $message -}}
{{- end -}}
{{- end -}}
