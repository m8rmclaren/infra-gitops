{{/*
Calculate the name of the Hydra public service
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
    {{- $fullName := printf "%s-auth-public" $name }}
    {{- $fullName = $fullName | trunc 63 | trimSuffix "-" }}
    {{- $fullName }}
{{- end }}
{{- end }}

{{/*
Calculate the name of the Hydra admin service
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
    {{- $fullName := printf "%s-auth-admin" $name }}
    {{- $fullName = $fullName | trunc 63 | trimSuffix "-" }}
    {{- $fullName }}
{{- end }}
{{- end }}

