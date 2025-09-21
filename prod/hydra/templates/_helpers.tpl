{{/*
Expand the name of the chart.
*/}}
{{- define "hydra.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "hydra.fullname" -}}
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
{{- define "hydra.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "hydra.labels" -}}
helm.sh/chart: {{ include "hydra.chart" . }}
{{ include "hydra.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "hydra.selectorLabels" -}}
app.kubernetes.io/name: {{ include "hydra.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Calculate the name of the public service
*/}}
{{- define "hydra.publicServiceName" -}}
{{- $name := "" }}
{{- if .Values.hydra.fullnameOverride }}
    {{- $name = .Values.hydra.fullnameOverride }}
    {{- $name = printf "%s-public" $name }}
    {{- $name }}
{{- else }}
    {{- $chartName := default .Values.hydra.nameOverride .Chart.Name }}
    {{- if contains $chartName .Release.Name }}
        {{- $name = .Release.Name }}
    {{- else }}
        {{- $name = printf "%s-%s" .Release.Name $chartName }}
    {{- end }}
    {{- $fullName := printf "%s-hydra-public" $name }}
    {{- $fullName = $fullName | trunc 63 | trimSuffix "-" }}
    {{- $fullName }}
{{- end }}
{{- end }}

{{/*
Calculate the name of the admin service
*/}}
{{- define "hydra.adminServiceName" -}}
{{- $name := "" }}
{{- if .Values.hydra.fullnameOverride }}
    {{- $name = .Values.hydra.fullnameOverride }}
    {{- $name = printf "%s-admin" $name }}
    {{- $name }}
{{- else }}
    {{- $chartName := default .Values.hydra.nameOverride .Chart.Name }}
    {{- if contains $chartName .Release.Name }}
        {{- $name = .Release.Name }}
    {{- else }}
        {{- $name = printf "%s-%s" .Release.Name $chartName }}
    {{- end }}
    {{- $fullName := printf "%s-hydra-admin" $name }}
    {{- $fullName = $fullName | trunc 63 | trimSuffix "-" }}
    {{- $fullName }}
{{- end }}
{{- end }}
