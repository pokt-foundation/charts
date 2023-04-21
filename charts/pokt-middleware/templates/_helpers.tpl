{{/*
Expand the name of the chart.
*/}}
{{- define "pokt-middleware.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "pokt-middleware.fullname" -}}
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
{{- define "pokt-middleware.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "pokt-middleware.labels" -}}
helm.sh/chart: {{ include "pokt-middleware.chart" . }}
{{ include "pokt-middleware.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "pokt-middleware.selectorLabels" -}}
app.kubernetes.io/name: {{ include "pokt-middleware.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "pokt-middleware.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "pokt-middleware.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}

{{/*
Probes definition
*/}}
{{- define "pokt-middleware.probes" -}}
{{- if .Values.probes.livenessProbe.enabled }}
livenessProbe:
  httpGet:
    path: {{ .Values.probes.livenessProbe.path | default "/healthz" }}
    port: http
  initialDelaySeconds: {{ .Values.probes.livenessProbe.initialDelaySeconds | default 30 }}
  periodSeconds: {{ .Values.probes.livenessProbe.periodSeconds  | default 10 }}
  timeoutSeconds: {{ .Values.probes.livenessProbe.timeoutSeconds | default 5 }}
  failureThreshold: {{ .Values.probes.livenessProbe.failureThreshold | default 6 }}
  successThreshold: {{ .Values.probes.livenessProbe.successThreshold | default 1}}
{{- end }}
{{- if .Values.probes.readinessProbe.enabled }}
readinessProbe:
  httpGet:
    path: {{ .Values.probes.readinessProbe.path | default "/healthz" }}
    port: http
  initialDelaySeconds: {{ .Values.probes.readinessProbe.initialDelaySeconds | default 30 }}
  periodSeconds: {{ .Values.probes.readinessProbe.periodSeconds | default 10 }}
  timeoutSeconds: {{ .Values.probes.readinessProbe.timeoutSeconds | default 5 }}
  failureThreshold: {{ .Values.probes.readinessProbe.failureThreshold | default 6 }}
  successThreshold: {{ .Values.probes.readinessProbe.successThreshold | default 1 }}
{{- end }}
{{- if .Values.probes.startupProbe.enabled }}
startupProbe:
  httpGet:
    path: {{ .Values.probes.startupProbe.path | default "/healthz" }}
    port: http
  initialDelaySeconds: {{ .Values.probes.startupProbe.initialDelaySeconds | default 30 }}
  periodSeconds: {{ .Values.probes.startupProbe.periodSeconds | default 10 }}
  timeoutSeconds: {{ .Values.probes.startupProbe.timeoutSeconds | default 5 }}
  failureThreshold: {{ .Values.probes.startupProbe.failureThreshold | default 6 }}
  successThreshold: {{ .Values.probes.startupProbe.successThreshold | default 1 }}
{{- end }}
{{- end }}
