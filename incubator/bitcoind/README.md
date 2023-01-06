# bitcoind

![Version: 0.1.5](https://img.shields.io/badge/Version-0.1.5-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: v0.21.0](https://img.shields.io/badge/AppVersion-v0.21.0-informational?style=flat-square)

A Helm chart for deploying Bitcoind

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| WesleyCharlesBlake |  |  |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` |  |
| autoscaling.enabled | bool | `false` |  |
| autoscaling.maxReplicas | int | `100` |  |
| autoscaling.minReplicas | int | `1` |  |
| autoscaling.targetCPUUtilizationPercentage | int | `80` |  |
| bitcoinData | string | `"/mnt/bitcoin"` |  |
| configurationFile."bitcoin.conf" | string | `"server=1\nprinttoconsole=1\nrpcuser=rpcuser\nrpcpassword=rpcpassword\nregtest=1\nblockfilterindex=basic\npeerblockfilters=1\npeerbloomfilters=0"` |  |
| fullnameOverride | string | `""` |  |
| image.pullPolicy | string | `"Always"` |  |
| image.repository | string | `"wesleycharlesblake/bitcoind"` |  |
| image.tag | string | `"latest"` |  |
| imagePullSecrets | list | `[]` |  |
| ingress.annotations | object | `{}` |  |
| ingress.enabled | bool | `false` |  |
| ingress.hosts[0].host | string | `"testnet.pokt.network"` |  |
| ingress.hosts[0].path | string | `"/"` |  |
| ingress.hosts[0].servicePort | int | `8080` |  |
| ingress.tls[0].hosts[0] | string | `"testnet.pokt.network"` |  |
| ingress.tls[0].secretName | string | `"letsencrypt-prod-issuer"` |  |
| metrics.enabled | bool | `false` |  |
| metrics.image.repository | string | `"pokt-foundation/bitcoind-exporter"` |  |
| metrics.image.tag | string | `"v0.2.0"` |  |
| metrics.port | int | `9439` |  |
| metrics.service.annotations."prometheus.io/port" | string | `"10254"` |  |
| metrics.service.annotations."prometheus.io/scrape" | string | `"true"` |  |
| metrics.service.externalIPs | list | `[]` |  |
| metrics.service.loadBalancerSourceRanges | list | `[]` |  |
| metrics.service.servicePort | int | `9435` |  |
| metrics.service.type | string | `"ClusterIP"` |  |
| metrics.serviceMonitor.additionalLabels | object | `{}` |  |
| metrics.serviceMonitor.enabled | bool | `false` |  |
| metrics.serviceMonitor.metricRelabelings | list | `[]` |  |
| metrics.serviceMonitor.namespace | string | `""` |  |
| metrics.serviceMonitor.namespaceSelector.any | bool | `true` |  |
| metrics.serviceMonitor.scrapeInterval | string | `"30s"` |  |
| metrics.serviceMonitor.targetLabels | list | `[]` |  |
| nameOverride | string | `""` |  |
| nodeSelector | object | `{}` |  |
| persistence.accessMode | string | `"ReadWriteOnce"` |  |
| persistence.annotations | object | `{}` |  |
| persistence.enabled | bool | `false` |  |
| persistence.size | string | `"450Gi"` |  |
| persistence.storageClass | string | `"standard"` |  |
| podAnnotations | object | `{}` |  |
| podSecurityContext | object | `{}` |  |
| rbac.enabled | bool | `true` |  |
| replicaCount | int | `1` |  |
| resources | object | `{}` |  |
| securityContext | object | `{}` |  |
| service.annotations | object | `{}` |  |
| service.p2pPort | int | `18333` |  |
| service.rpcPort | int | `18332` |  |
| service.type | string | `"ClusterIP"` |  |
| serviceAccount.annotations | object | `{}` |  |
| serviceAccount.create | bool | `true` |  |
| serviceAccount.name | string | `""` |  |
| tolerations | list | `[]` |  |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.11.0](https://github.com/norwoodj/helm-docs/releases/v1.11.0)