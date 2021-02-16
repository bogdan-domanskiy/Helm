{{/*
Create a default fully qualified app name.
*/}}
{{- define "app.fullname" -}}
  {{- if .Values.Name -}}
   {{- .Values.Name -}}
  {{- else -}}
    {{- .Release.Name | trunc 63 -}}
  {{- end -}}
{{- end -}}


{{- define "deploy.image-and-repo" }}
  {{- if .Values.deployment.imagerepository -}}
    {{ .Values.deployment.imagerepository}}/{{.Values.deployment.imageName }}
  {{- else -}}
    {{ .Values.deployment.imageName }}
  {{- end -}}
{{- end -}}

{{- define "deploy.image-name" }}
  {{- if .Values.deployment.imageTag -}}
    {{ (include "deploy.image-and-repo" .)}}:{{.Values.deployment.imageTag }}
  {{- else -}}
    {{ (include "deploy.image-and-repo" .) }}
  {{- end -}}
{{- end -}}