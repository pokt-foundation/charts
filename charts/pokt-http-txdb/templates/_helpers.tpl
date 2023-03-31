{{/*
Expand the name of the chart.
*/}}
{{- define "pokt-http-txdb.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "pokt-http-txdb.fullname" -}}
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
{{- define "pokt-http-txdb.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "pokt-http-txdb.labels" -}}
helm.sh/chart: {{ include "pokt-http-txdb.chart" . }}
{{ include "pokt-http-txdb.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "pokt-http-txdb.selectorLabels" -}}
app.kubernetes.io/name: {{ include "pokt-http-txdb.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "pokt-http-txdb.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "pokt-http-txdb.fullname" .) .Values.serviceAccount.name }}
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

{{/*
Autoscaling behavior definition
*/}}
{{- define "pokt-http-txdb.autoscaling-behavior" -}}
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

{{/*
Probes definition
*/}}
{{- define "pokt-http-txdb.probes" -}}
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
