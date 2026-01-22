# helm-etcd

Helm chart for deploying an etcd cluster.

## Values

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `ha_enabled` | bool | `true` | Enable high-availability mode. |
| `replicas` | int | `3` | Number of etcd replicas. |
| `image` | string | `"quay.io/coreos/etcd:v3.6.6"` | Etcd image to deploy. |
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
