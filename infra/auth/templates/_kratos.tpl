{{/*
Calculate the name of the Kratos public service
*/}}
{{- define "kratos.publicServiceName" -}}
{{- $name := "" }}
{{- if .Values.kratos.fullnameOverride }}
    {{- $name = .Values.kratos.fullnameOverride }}
    {{- $name = printf "%s-public" $name }}
    {{- $name }}
{{- else }}
    {{- $chartName := default .Values.kratos.nameOverride .Chart.Name }}
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
Calculate the name of the Kratos admin service
*/}}
{{- define "kratos.adminServiceName" -}}
{{- $name := "" }}
{{- if .Values.kratos.fullnameOverride }}
    {{- $name = .Values.kratos.fullnameOverride }}
    {{- $name = printf "%s-admin" $name }}
    {{- $name }}
{{- else }}
    {{- $chartName := default .Values.kratos.nameOverride .Chart.Name }}
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

