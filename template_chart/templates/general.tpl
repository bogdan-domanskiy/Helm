{{/*
Create a default fully qualified app name.
*/}}
{{- define "app.fullname" -}}
  {{- if .Values.Name -}}
   {{- .Values.Name - }}
  {{- else -}}
    {{- .Release.Name | trunc 63 -}}
  {{- end -}}
{{- end -}}


{{/*
Set a default version of app.
*/}}
{{- define "app.version" -}}
  {{- if .Values.Version -}}
    {{- .Values.Version -}}
  {{- else -}}
    {{- .Chart.Version .Release.Revision -}}
  {{- end -}}
{{- end -}}

{{/*
Allow the release namespace to be overridden for multi-namespace deployments in combined charts
*/}}
{{- define "grafana.namespace" -}}
  {{- if .Values.namespaceOverride -}}
    {{- .Values.namespaceOverride -}}
  {{- else -}}
    {{- .Release.Namespace -}}
  {{- end -}}
{{- end -}}