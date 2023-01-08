# pokt-relay-meter

![Version: 0.0.3](https://img.shields.io/badge/Version-0.0.3-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 0.0.1](https://img.shields.io/badge/AppVersion-0.0.1-informational?style=flat-square)

A Helm chart for deploying the POKT Relay Meter service

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| rutwickjain87 |  | <https://github.com/rutwickjain87> |
| pokt-foundation |  | <https://github.com/pokt-foundation/charts> |

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| https://charts.bitnami.com/bitnami | postgresql | 12.1.0 |
| https://helm.influxdata.com/ | influxdb2 | 2.1.1 |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` |  |
| apiserver.env.normal.API_SERVER_PORT | int | `80` |  |
| apiserver.env.normal.BACKEND_API_URL | string | `"https://postgres-api.backend.pokt.network"` |  |
| apiserver.env.normal.POSTGRES_DB | string | `"relay-meter"` |  |
| apiserver.env.normal.POSTGRES_HOST | string | `"postgres"` |  |
| apiserver.env.normal.POSTGRES_PORT | int | `5432` |  |
| apiserver.env.normal.POSTGRES_USER | string | `"pokt"` |  |
| apiserver.env.secret.BACKEND_API_TOKEN | string | `"dummy"` |  |
| apiserver.env.secret.POSTGRES_PASSWORD | string | `"P0K7p05tgr3s8"` |  |
| apiserver.image.pullPolicy | string | `"IfNotPresent"` |  |
| apiserver.image.repository | string | `"pocketfoundation/relay-meter-apiserver"` |  |
| apiserver.resources | object | `{}` |  |
| autoscaling.enabled | bool | `false` |  |
| autoscaling.maxReplicas | int | `100` |  |
| autoscaling.minReplicas | int | `3` |  |
| autoscaling.targetCPUUtilizationPercentage | int | `80` |  |
| collector.env.normal.COLLECTION_INTERVAL_SECONDS | int | `30` |  |
| collector.env.normal.ENV_REPORT_INTERVAL_SECONDS | int | `10` |  |
| collector.env.normal.INFLUXDB_BUCKET_CURRENT | string | `"default"` |  |
| collector.env.normal.INFLUXDB_BUCKET_DAILY | string | `"default"` |  |
| collector.env.normal.INFLUXDB_ORG | string | `"demand-infra"` |  |
| collector.env.normal.INFLUXDB_URL | string | `"http://influxdb"` |  |
| collector.env.normal.POSTGRES_DB | string | `"relay-meter"` |  |
| collector.env.normal.POSTGRES_HOST | string | `"postgres"` |  |
| collector.env.normal.POSTGRES_PORT | int | `5432` |  |
| collector.env.normal.POSTGRES_USER | string | `"pokt"` |  |
| collector.env.secret.INFLUXDB_TOKEN | string | `"xbvafasvxgxg1262619"` |  |
| collector.env.secret.POSTGRES_PASSWORD | string | `"P0K7p05tgr3s8"` |  |
| collector.image.pullPolicy | string | `"IfNotPresent"` |  |
| collector.image.repository | string | `"pocketfoundation/relay-meter-collector"` |  |
| collector.resources | object | `{}` |  |
| externalSecrets.enabled | bool | `false` |  |
| externalSecrets.key | string | `"relay-meter/staging/env"` |  |
| externalSecrets.vault.mountPath | string | `"k8s-mount-path"` |  |
| externalSecrets.vault.namespace | string | `"our/namespace/"` |  |
| externalSecrets.vault.path | string | `"path/"` |  |
| externalSecrets.vault.role | string | `"my-role"` |  |
| externalSecrets.vault.server | string | `"https://vault:8200"` |  |
| externalSecrets.vault.serviceAccount | string | `"portal-api"` |  |
| externalSecrets.vault.version | string | `"v1"` |  |
| fullnameOverride | string | `""` |  |
| imagePullSecrets | list | `[]` |  |
| influxdb2.adminUser.bucket | string | `"default"` |  |
| influxdb2.adminUser.organization | string | `"demand-infra"` |  |
| influxdb2.adminUser.password | string | `"SuperS3cr37P@5$w0rd"` |  |
| influxdb2.adminUser.retention_policy | string | `"0s"` |  |
| influxdb2.adminUser.token | string | `"xbvafasvxgxg1262619"` |  |
| influxdb2.adminUser.user | string | `"admin"` |  |
| influxdb2.enabled | bool | `false` |  |
| influxdb2.fullnameOverride | string | `"influxdb"` |  |
| influxdb2.persistence.enabled | bool | `false` |  |
| ingress.annotations | object | `{}` |  |
| ingress.className | string | `""` |  |
| ingress.enabled | bool | `false` |  |
| ingress.hosts[0].host | string | `"chart-example.local"` |  |
| ingress.hosts[0].paths[0].path | string | `"/"` |  |
| ingress.hosts[0].paths[0].pathType | string | `"ImplementationSpecific"` |  |
| ingress.tls | list | `[]` |  |
| nameOverride | string | `""` |  |
| nodeSelector | object | `{}` |  |
| podAnnotations | object | `{}` |  |
| podSecurityContext | object | `{}` |  |
| postgresql.architecture | string | `"standalone"` |  |
| postgresql.auth.database | string | `"relay-meter"` |  |
| postgresql.auth.password | string | `"P0K7p05tgr3s8"` |  |
| postgresql.auth.username | string | `"pokt"` |  |
| postgresql.enabled | bool | `false` |  |
| postgresql.fullnameOverride | string | `"postgres"` |  |
| postgresql.primary.initdb.scripts."00_db_init_script.sql.sql" | string | `"DROP TABLE IF EXISTS relay_counts;\nDROP TABLE IF EXISTS daily_app_sums;\nDROP TABLE IF EXISTS todays_app_sums;\nDROP TABLE IF EXISTS todays_app_latencies;\n\nCREATE TABLE relay_counts (\n  id INT GENERATED ALWAYS AS IDENTITY,\n  application VARCHAR NOT NULL,\n  count_success bigint NOT NULL,\n  count_failure bigint NOT NULL,\n  time TIMESTAMPTZ\n);\nCREATE TABLE daily_app_sums (\n  id INT GENERATED ALWAYS AS IDENTITY,\n  application VARCHAR NOT NULL,\n  count_success bigint NOT NULL,\n  count_failure bigint NOT NULL,\n  time TIMESTAMPTZ\n);\nCREATE TABLE todays_app_sums (\n  id INT GENERATED ALWAYS AS IDENTITY,\n  application VARCHAR NOT NULL,\n  count_success bigint NOT NULL,\n  count_failure bigint NOT NULL\n);\nCREATE TABLE todays_app_latencies (\n  id INT GENERATED ALWAYS AS IDENTITY,\n  application VARCHAR NOT NULL,\n  time VARCHAR NOT NULL,\n  latency DECIMAL NOT NULL\n);\n"` |  |
| postgresql.primary.persistence.enabled | bool | `false` |  |
| replicaCount | int | `1` |  |
| securityContext | object | `{}` |  |
| service.port | int | `80` |  |
| service.type | string | `"ClusterIP"` |  |
| serviceAccount.annotations | object | `{}` |  |
| serviceAccount.create | bool | `true` |  |
| serviceAccount.name | string | `""` |  |
| tolerations | list | `[]` |  |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.11.0](https://github.com/norwoodj/helm-docs/releases/v1.11.0)
