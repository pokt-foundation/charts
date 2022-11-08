{{/*
Expand the name of the chart.
*/}}
{{- define "pokt-portal-workers.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "pokt-portal-workers.fullname" -}}
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
{{- define "pokt-portal-workers.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "pokt-portal-workers.labels" -}}
helm.sh/chart: {{ include "pokt-portal-workers.chart" . }}
{{ include "pokt-portal-workers.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "pokt-portal-workers.selectorLabels" -}}
app.kubernetes.io/name: {{ include "pokt-portal-workers.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "pokt-portal-workers.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "pokt-portal-workers.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}

{{/*
Create secret env vars from values.portal-workers-analytics.env
*/}}

{{- define "helpers.portal-workers-analytics.secret-env-variables"}}
{{- $secretName := printf "%s-portal-workers-analytics-vars" .Release.Name -}}
{{- range $key, $val := .Values.analytics.env.secret }}
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
{{- define "helpers.portal-workers-analytics.list-env-variables"}}
{{- range $key, $val := .Values.analytics.env.normal }}
- name: {{ $key }}
  value: {{ $val | quote }}
{{- end }}
{{- end }}

{{/*
Create secret env vars from values.portal-workers-notifier.env
*/}}

{{- define "helpers.portal-workers-notifier.secret-env-variables"}}
{{- $secretName := printf "%s-portal-workers-notifier-vars" .Release.Name -}}
{{- range $key, $val := .Values.notifier.env.secret }}
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
{{- define "helpers.portal-workers-notifier.list-env-variables"}}
{{- range $key, $val := .Values.notifier.env.normal }}
- name: {{ $key }}
  value: {{ $val | quote }}
{{- end }}
{{- end }}

{{/*
Create secret env vars from values.portal-workers-stripe.env
*/}}

{{- define "helpers.portal-workers-stripe.secret-env-variables"}}
{{- $secretName := printf "%s-portal-workers-stripe-vars" .Release.Name -}}
{{- range $key, $val := .Values.stripe.env.secret }}
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
{{- define "helpers.portal-workers-stripe.list-env-variables"}}
{{- range $key, $val := .Values.stripe.env.normal }}
- name: {{ $key }}
  value: {{ $val | quote }}
{{- end }}
{{- end }}
