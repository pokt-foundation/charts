{{/*
Expand the name of the chart.
*/}}
{{- define "portal-middleware.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "portal-middleware.fullname" -}}
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
{{- define "portal-middleware.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "portal-middleware.labels" -}}
helm.sh/chart: {{ include "portal-middleware.chart" . }}
{{ include "portal-middleware.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "portal-middleware.selectorLabels" -}}
app.kubernetes.io/name: {{ include "portal-middleware.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "portal-middleware.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "portal-middleware.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}

{{/*
Create secret env vars from a values.env
*/}}

{{- define "helpers.secret-env-variables"}}
{{- $secretName := printf "%s-vars" .Release.Name -}}
{{- range $key, $val := .Values.env.secret }}
- name: {{ $key }}
  valueFrom:
    secretKeyRef:
      name: {{ $secretName }}
      key: {{ $key }}
{{- end}}
{{- end}}

{{/*
Create normal env vars from list
*/}}
{{- define "helpers.list-env-variables"}}
{{- range $key, $val := .Values.env.normal }}
- name: {{ $key }}
  value: {{ $val | quote }}
{{- end }}
{{- end }}


*/}}
{{- define "helpers.redis-env-variables"}}
{{- range $key, $val := .Values.localRedis.env }}
- name: {{ $key }}
  value: {{ $val | quote }}
{{- end }}
{{- end }}

{{/*
Autoscaling behavior definition
*/}}
{{- define "portal-middleware.autoscaling-behavior" -}}
{{- $stabilizationWindow := 300 }}
{{- $policyMax := "Max" }}
{{- $policyMin := "Min" }}
behavior:
  scaleDown:
    stabilizationWindowSeconds: {{ .Values.autoscaling.policies.behavior.scaleDown.stabilizationWindowSeconds | default $stabilizationWindow }}
    selectPolicy: {{ .Values.autoscaling.policies.behavior.scaleDown.selectPolicy | default $policyMin }}
    policies:
      {{- toYaml .Values.autoscaling.policies.behavior.scaleDown.policies }}
  scaleUp:
    stabilizationWindowSeconds: {{ .Values.autoscaling.policies.behavior.scaleUp.stabilizationWindowSeconds | default $stabilizationWindow }}
    selectPolicy: {{ .Values.autoscaling.policies.behavior.scaleUp.selectPolicy | default $policyMax }}
    policies:
      {{- toYaml .Values.autoscaling.policies.behavior.scaleUp.policies }}
{{- end }}
