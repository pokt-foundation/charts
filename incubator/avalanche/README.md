# avalanche

![Version: 0.0.14](https://img.shields.io/badge/Version-0.0.14-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: v1.7.5](https://img.shields.io/badge/AppVersion-v1.7.5-informational?style=flat-square)

A Helm chart for Kubernetes

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| WesleyCharlesBlake |  |  |
| pokt-foundation |  |  |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` |  |
| autoscaling.enabled | bool | `false` |  |
| autoscaling.maxReplicas | int | `100` |  |
| autoscaling.minReplicas | int | `1` |  |
| autoscaling.targetCPUUtilizationPercentage | int | `80` |  |
| avalanche.extraArgs | list | `[]` |  |
| avalanche.httpHost | string | `""` |  |
| avalanche.logLevel | string | `"Info"` |  |
| avalanche.networkID | string | `"testnet"` |  |
| fullnameOverride | string | `""` |  |
| http.ingress.annotations | object | `{}` |  |
| http.ingress.className | string | `""` |  |
| http.ingress.enabled | bool | `false` |  |
| http.ingress.hostname | string | `"chart-example.local"` |  |
| http.service.port | int | `9650` |  |
| http.service.type | string | `"ClusterIP"` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.repository | string | `"avaplatform/avalanchego"` |  |
| image.tag | string | `""` |  |
| imagePullSecrets | list | `[]` |  |
| nameOverride | string | `""` |  |
| nodeSelector | object | `{}` |  |
| podAnnotations | object | `{}` |  |
| podSecurityContext | object | `{}` |  |
| replicaCount | int | `1` |  |
| resources | object | `{}` |  |
| securityContext | object | `{}` |  |
| serviceAccount.annotations | object | `{}` |  |
| serviceAccount.create | bool | `true` |  |
| serviceAccount.name | string | `""` |  |
| staking.ingress.annotations | object | `{}` |  |
| staking.ingress.className | string | `""` |  |
| staking.ingress.enabled | bool | `false` |  |
| staking.ingress.hostname | string | `"chart-example.local"` |  |
| staking.service.port | int | `9651` |  |
| staking.service.type | string | `"ClusterIP"` |  |
| storageSize | string | `"500Gi"` |  |
| tolerations | list | `[]` |  |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.11.0](https://github.com/norwoodj/helm-docs/releases/v1.11.0)
