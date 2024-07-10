{{- define "nginx-chart.name" -}}
{{- .Chart.Name | lower -}}
{{- end -}}

{{- define "nginx-chart.chart" -}}
{{- .Chart.Name | lower }}-{{ .Chart.Version | replace "+" "_" | replace "." "_" -}}
{{- end -}}

{{- define "nginx-chart.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else }}
{{- .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}

