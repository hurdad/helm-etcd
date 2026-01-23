# helm-etcd

Helm chart for deploying an etcd cluster.

## Values

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `haEnabled` | bool | `true` | Enable high-availability mode. |
| `haReplicas` | int | `3` | Number of etcd replicas in high-availability mode. |
| `standaloneReplicas` | int | `1` | Number of etcd replicas in standalone mode. |
| `image.repository` | string | `"quay.io/coreos/etcd"` | Etcd image repository to deploy. |
| `image.tag` | string | `"v3.6.6"` | Etcd image tag to deploy. |
| `image.digest` | string | `""` | Etcd image digest (overrides the tag when set). |
| `image.pullPolicy` | string | `IfNotPresent` | Image pull policy. |
| `grpcPort` | int | `2379` | gRPC client service port. |
| `httpPort` | int | `2381` | HTTP client port for health checks and HTTP endpoints. |
| `service.type` | string | `ClusterIP` | Kubernetes service type. |
| `storage.size` | string | `10Gi` | Persistent volume size. |
| `storage.storageClassName` | string | `""` | Storage class name (empty uses default). |
| `healthChecks.enabled` | bool | `true` | Enable liveness, readiness, and startup probes. |
| `healthChecks.liveness.path` | string | `/health` | HTTP path for the liveness probe. |
| `healthChecks.liveness.initialDelaySeconds` | int | `10` | Initial delay before the liveness probe starts. |
| `healthChecks.liveness.periodSeconds` | int | `10` | Liveness probe period. |
| `healthChecks.liveness.timeoutSeconds` | int | `5` | Liveness probe timeout. |
| `healthChecks.liveness.failureThreshold` | int | `6` | Liveness probe failure threshold. |
| `healthChecks.readiness.path` | string | `/health` | HTTP path for the readiness probe. |
| `healthChecks.readiness.initialDelaySeconds` | int | `5` | Initial delay before the readiness probe starts. |
| `healthChecks.readiness.periodSeconds` | int | `5` | Readiness probe period. |
| `healthChecks.readiness.timeoutSeconds` | int | `3` | Readiness probe timeout. |
| `healthChecks.readiness.failureThreshold` | int | `3` | Readiness probe failure threshold. |
| `healthChecks.startup.path` | string | `/health` | HTTP path for the startup probe. |
| `healthChecks.startup.periodSeconds` | int | `5` | Startup probe period. |
| `healthChecks.startup.timeoutSeconds` | int | `3` | Startup probe timeout. |
| `healthChecks.startup.failureThreshold` | int | `30` | Startup probe failure threshold. |
| `pvcRetentionPolicy.enabled` | bool | `false` | Enable StatefulSet PVC retention policy (Kubernetes 1.21+). |
| `pvcRetentionPolicy.whenDeleted` | string | `Retain` | PVC retention when the StatefulSet is deleted (`Retain` or `Delete`). |
| `pvcRetentionPolicy.whenScaled` | string | `Retain` | PVC retention when the StatefulSet is scaled down (`Retain` or `Delete`). |
| `commonLabels` | object | `{}` | Labels applied to all resources in the chart. |
| `commonAnnotations` | object | `{}` | Annotations applied to all resources in the chart. |
| `podLabels` | object | `{}` | Extra labels applied to pods. |
| `podAnnotations` | object | `{}` | Extra annotations applied to pods. |
| `serviceAnnotations` | object | `{}` | Extra annotations applied to Services. |
| `pvcAnnotations` | object | `{}` | Extra annotations applied to PVCs. |
| `affinity` | object | `{}` | Custom pod affinity/anti-affinity rules (overrides built-in HA pod anti-affinity). |
| `topologySpreadConstraints` | list | `[]` | Custom topology spread constraints (overrides built-in HA spread constraints). |
| `haPodAntiAffinity.enabled` | bool | `true` | Enable preferred HA pod anti-affinity to avoid co-scheduling on the same node. |
| `haPodAntiAffinity.weight` | int | `100` | Weight for the preferred HA pod anti-affinity rule. |
| `haPodAntiAffinity.topologyKey` | string | `kubernetes.io/hostname` | Topology key for the HA pod anti-affinity rule. |
| `topologySpread.enabled` | bool | `true` | Enable default topology spread constraints for HA pods. |
| `topologySpread.maxSkew` | int | `1` | Maximum skew for default topology spread constraints. |
| `topologySpread.whenUnsatisfiable` | string | `ScheduleAnyway` | Behavior when topology spread constraints cannot be satisfied. |
| `topologySpread.includeZone` | bool | `true` | Also spread HA pods across zones when the label is available. |
| `tls.client.enabled` | bool | `false` | Enable TLS for client (gRPC/HTTP) endpoints. |
| `tls.client.secretName` | string | `""` | Secret name containing the client TLS certs. |
| `tls.client.mountPath` | string | `/etc/etcd/tls/client` | Mount path for client TLS assets. |
| `tls.client.certFile` | string | `tls.crt` | Client certificate filename inside the secret. |
| `tls.client.keyFile` | string | `tls.key` | Client key filename inside the secret. |
| `tls.client.caFile` | string | `ca.crt` | Client CA filename inside the secret. |
| `tls.client.clientCertAuth` | bool | `false` | Require client certificates for authentication. |
| `tls.peer.enabled` | bool | `false` | Enable TLS for peer endpoints (HA mode). |
| `tls.peer.secretName` | string | `""` | Secret name containing the peer TLS certs. |
| `tls.peer.mountPath` | string | `/etc/etcd/tls/peer` | Mount path for peer TLS assets. |
| `tls.peer.certFile` | string | `tls.crt` | Peer certificate filename inside the secret. |
| `tls.peer.keyFile` | string | `tls.key` | Peer key filename inside the secret. |
| `tls.peer.caFile` | string | `ca.crt` | Peer CA filename inside the secret. |
| `tls.peer.clientCertAuth` | bool | `false` | Require peer client certificates for authentication. |
| `auth.enabled` | bool | `false` | Enable auth token configuration for etcd. |
| `auth.tokenType` | string | `""` | Auth token type for etcd (`jwt` when enabled). |
