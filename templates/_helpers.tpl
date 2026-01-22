{{/*
Expand the name of the chart.
*/}}
{{- define "etcd.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
*/}}
{{- define "etcd.fullname" -}}
{{- if .Values.fullnameOverride -}}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s" .Release.Name (include "etcd.name" .) | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}

{{/*
Kubernetes namespace for resources.
*/}}
{{- define "etcd.namespace" -}}
{{- .Release.Namespace -}}
{{- end -}}

{{/*
Headless service name for etcd.
*/}}
{{- define "etcd.headlessName" -}}
{{- printf "%s-etcd-headless" .Release.Name -}}
{{- end -}}

{{/*
Initial cluster list for etcd HA mode.
*/}}
{{- define "etcd.initialCluster" -}}
{{- $replicas := int .Values.replicas -}}
{{- $name := include "etcd.fullname" . -}}
{{- $svc := include "etcd.headlessName" . -}}
{{- $entries := list -}}
{{- range $index := until $replicas -}}
{{- $peer := printf "%s-%d=http://%s-%d.%s:2380" $name $index $name $index $svc -}}
{{- $entries = append $entries $peer -}}
{{- end -}}
{{- join "," $entries -}}
{{- end -}}
