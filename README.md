# helm-etcd

Helm chart for deploying an etcd cluster.

## Values

| Name | Type | Default | Description |
| --- | --- | --- | --- |
| `ha_enabled` | bool | `true` | Enable high-availability mode. |
| `replicas` | int | `3` | Number of etcd replicas. |
| `image` | string | `"quay.io/coreos/etcd:v3.6.6"` | Etcd image to deploy. |
| `port` | int | `2379` | Client service port. |
| `service.type` | string | `ClusterIP` | Kubernetes service type. |
| `storage.size` | string | `10Gi` | Persistent volume size. |
| `storage.storageClassName` | string | `""` | Storage class name (empty uses default). |
