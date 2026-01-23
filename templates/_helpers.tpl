{{/*
Expand the name of the chart.
*/}}
{{- define "etcd.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "etcd.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" -}}
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
Common labels for all resources.
*/}}
{{- define "etcd.labels" -}}
app: {{ include "etcd.fullname" . }}
app.kubernetes.io/name: {{ include "etcd.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
helm.sh/chart: {{ include "etcd.chart" . }}
{{- end -}}

{{/*
Labels used for selectors.
*/}}
{{- define "etcd.selectorLabels" -}}
app: {{ include "etcd.fullname" . }}
app.kubernetes.io/name: {{ include "etcd.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
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
{{- $replicas := int .Values.haReplicas -}}
{{- $name := include "etcd.fullname" . -}}
{{- $svc := include "etcd.headlessName" . -}}
{{- $scheme := ternary "https" "http" .Values.tls.peer.enabled -}}
{{- $entries := list -}}
{{- range $index := until $replicas -}}
{{- $peer := printf "%s-%d=%s://%s-%d.%s:%d" $name $index $scheme $name $index $svc (int $.Values.peerPort) -}}
{{- $entries = append $entries $peer -}}
{{- end -}}
{{- join "," $entries -}}
{{- end -}}

{{/*
Etcd image reference.
*/}}
{{- define "etcd.image" -}}
{{- $repository := .Values.image.repository -}}
{{- $tag := default .Chart.AppVersion .Values.image.tag -}}
{{- if .Values.image.digest -}}
{{- printf "%s@%s" $repository .Values.image.digest -}}
{{- else -}}
{{- printf "%s:%s" $repository $tag -}}
{{- end -}}
{{- end -}}
