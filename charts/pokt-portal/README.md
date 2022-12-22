# pokt-portal

![Version: 0.1.9](https://img.shields.io/badge/Version-0.1.9-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 0.1.0](https://img.shields.io/badge/AppVersion-0.1.0-informational?style=flat-square)

A Helm chart for deploying the POKT Portal API services

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| WesleyCharlesBlake |  | <https://github.com/WesleyCharlesBlake/> |
| pokt-foundation |  | <https://github.com/pokt-foundation/charts> |

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| https://charts.bitnami.com/bitnami | mongodb | 13.3.0 |
| https://charts.bitnami.com/bitnami | postgresql | 12.1.0 |
| https://charts.bitnami.com/bitnami | redis | 17.3.7 |
| https://helm.influxdata.com/ | influxdb2 | 2.1.1 |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` |  |
| autoscaling.enabled | bool | `true` |  |
| autoscaling.maxReplicas | int | `100` |  |
| autoscaling.minReplicas | int | `3` |  |
| autoscaling.targetCPUUtilizationPercentage | int | `80` |  |
| autoscaling.targetMemoryUtilizationPercentage | int | `80` |  |
| env.normal.REDIS_PORT | string | `"6379"` |  |
| env.secret.AAT_PLAN | string | `"freemium"` |  |
| env.secret.ARCHIVAL_CHAINS | string | `"0022,0028,0010,000A,000B,000C"` |  |
| env.secret.AWS_ACCESS_KEY_ID | string | `"AXAI"` |  |
| env.secret.AWS_SECRET_ACCESS_KEY | string | `"xYansdlapq912n"` |  |
| env.secret.BLOCKED_ADDRESSES_URL | string | `"https://blocked-addresses.s3.us-west-2.amazonaws.com/blocked_address.json"` |  |
| env.secret.DATABASE_ENCRYPTION_KEY | string | `"00000000000000000000000000000000"` |  |
| env.secret.DATADOG_API_KEY | string | `"myApiKey"` |  |
| env.secret.DEFAULT_LOG_LIMIT_BLOCKS | string | `"10000"` |  |
| env.secret.DEFAULT_SYNC_ALLOWANCE | string | `"5"` |  |
| env.secret.DISPATCH_URL | string | `"https://node1.mainnet.pokt.network"` |  |
| env.secret.GATEWAY_CLIENT_PASSPHRASE | string | `"v3rys3cr3tp4ssphr4ze"` |  |
| env.secret.GATEWAY_CLIENT_PRIVATE_KEY | string | `"v3rys3cr3tk3yud0nt3venkn0w"` |  |
| env.secret.GATEWAY_HOST | string | `"localhost"` |  |
| env.secret.INFLUX_ORGS | string | `"demand-infra"` |  |
| env.secret.INFLUX_TOKENS | string | `"xbvafasvxgxg1262619"` |  |
| env.secret.INFLUX_URLS | string | `"http://influxdb"` |  |
| env.secret.LOCAL_REDIS_ENDPOINT | string | `"localhost:6379"` |  |
| env.secret.LOGZ_TOKEN | string | `"12345"` |  |
| env.secret.LOG_TO_CLOUDWATCH | string | `"false"` |  |
| env.secret.LOG_TO_DATADOG | string | `"false"` |  |
| env.secret.MONGO_ENDPOINT | string | `"mongodb://pokt:P0K7m0ngod8@mongodb:27017/gateway"` |  |
| env.secret.NODE_ENV | string | `"development"` |  |
| env.secret.NODE_TLS_REJECT_UNAUTHORIZED | string | `"0"` |  |
| env.secret.POCKET_BLOCK_TIME | string | `"1038000"` |  |
| env.secret.POCKET_RELAY_RETRIES | string | `"0"` |  |
| env.secret.POCKET_SESSION_BLOCK_FREQUENCY | string | `"4"` |  |
| env.secret.PSQL_CERTIFICATE | string | `"https://s3.amazonaws.com/"` |  |
| env.secret.PSQL_CONNECTION | string | `"postgres://pokt:P0K7p05tgr3s8@postgres:5432/metrics"` |  |
| env.secret.REDIS_LOCAL_TTL_FACTOR | string | `"1"` |  |
| env.secret.REGION | string | `"localhost"` |  |
| env.secret.REMOTE_REDIS_ENDPOINT | string | `"redis-master:6379"` |  |
| env.secret.WATCH | string | `"true"` |  |
| externalSecrets.decodginStrategy | string | `"None"` |  |
| externalSecrets.enabled | bool | `false` |  |
| externalSecrets.key | string | `"some/path/secret"` |  |
| externalSecrets.secretStore | string | `"vault"` |  |
| externalSecrets.vault.mountPath | string | `"k8s-mount-path"` |  |
| externalSecrets.vault.namespace | string | `"our/namespace/"` |  |
| externalSecrets.vault.path | string | `"path/"` |  |
| externalSecrets.vault.role | string | `"my-role"` |  |
| externalSecrets.vault.server | string | `"https://vault:8200"` |  |
| externalSecrets.vault.serviceAccount | string | `"portal-api"` |  |
| externalSecrets.vault.version | string | `"v1"` |  |
| fullnameOverride | string | `""` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.repository | string | `"pocketfoundation/portal-api"` |  |
| image.tag | string | `"0.0.36"` |  |
| imagePullSecrets | list | `[]` |  |
| influxdb2.adminUser.bucket | string | `"default"` |  |
| influxdb2.adminUser.organization | string | `"demand-infra"` |  |
| influxdb2.adminUser.password | string | `"SuperS3cr37P@5$w0rd"` |  |
| influxdb2.adminUser.retention_policy | string | `"0s"` |  |
| influxdb2.adminUser.token | string | `"xbvafasvxgxg1262619"` |  |
| influxdb2.adminUser.user | string | `"admin"` |  |
| influxdb2.enabled | bool | `true` |  |
| influxdb2.fullnameOverride | string | `"influxdb"` |  |
| influxdb2.persistence.enabled | bool | `false` |  |
| ingress.annotations | object | `{}` |  |
| ingress.className | string | `""` |  |
| ingress.enabled | bool | `false` |  |
| ingress.hosts[0].host | string | `"*.localhost"` |  |
| ingress.hosts[0].paths[0].path | string | `"/"` |  |
| ingress.hosts[0].paths[0].pathType | string | `"ImplementationSpecific"` |  |
| ingress.tls[0].hosts[0] | string | `"mydomain.com"` |  |
| ingress.tls[0].secretName | string | `"mydomain-com-tls"` |  |
| localRedis.envs.ALLOW_EMPTY_PASSWORD | string | `"yes"` |  |
| localRedis.image.repository | string | `"redis"` |  |
| localRedis.image.tag | string | `"6.2-alpine"` |  |
| middleware.config_json | string | `"{\n  \"backend_url\": \"http://localhost:3000\",\n\t\"chain_mappings\": {\n\t\t\"eth-mainnet\": \"eth\",\n\t\t\"eth-goerli\": \"eth\"\n\t},\n\t\"plugins_config\": {\n\t\t\"plugins\": [\n\t\t\t\"mev\"\n\t\t],\n\t\t\"mev\": {\n\t\t\t\"chains\": {\n\t\t\t\t\"avax\": {\n\t\t\t\t\t\"provider\": \"avax-provider\",\n\t\t\t\t\t\"sleep_duration\": 1234\n\t\t\t\t}\n\t\t\t}\n\t\t}\n\t}\n}\n"` |  |
| middleware.enabled | bool | `true` |  |
| middleware.envs.BACKEND_URL | string | `"http://localhost:3000"` |  |
| middleware.externalSecrets.decodginStrategy | string | `"Auto"` |  |
| middleware.externalSecrets.key | string | `"some/path/secret"` |  |
| middleware.image.pullPolicy | string | `"IfNotPresent"` |  |
| middleware.image.repository | string | `"pocketfoundation/portal-middleware"` |  |
| middleware.image.tag | string | `"0.0.49"` |  |
| middleware.livenessProbe.enabled | bool | `true` |  |
| middleware.readinessProbe.enabled | bool | `true` |  |
| middleware.startupProbe.enabled | bool | `true` |  |
| mongodb.auth.databases[0] | string | `"gateway"` |  |
| mongodb.auth.passwords[0] | string | `"P0K7m0ngod8"` |  |
| mongodb.auth.rootPassword | string | `"SuperS3cr37P@5$w0rd"` |  |
| mongodb.auth.usernames[0] | string | `"pokt"` |  |
| mongodb.enabled | bool | `true` |  |
| mongodb.fullnameOverride | string | `"mongodb"` |  |
| mongodb.persistence.enabled | bool | `false` |  |
| mongodb.port | int | `27017` |  |
| nameOverride | string | `""` |  |
| nodeSelector | object | `{}` |  |
| podAnnotations | object | `{}` |  |
| podSecurityContext | object | `{}` |  |
| postgresql.architecture | string | `"standalone"` |  |
| postgresql.auth.database | string | `"metrics"` |  |
| postgresql.auth.password | string | `"P0K7p05tgr3s8"` |  |
| postgresql.auth.username | string | `"pokt"` |  |
| postgresql.enabled | bool | `true` |  |
| postgresql.fullnameOverride | string | `"postgres"` |  |
| postgresql.primary.initdb.scripts."00_db_init_script.sql.sql" | string | `"CREATE TABLE error (\n  timestamp TIMESTAMPTZ NOT NULL,\n  applicationpublickey TEXT NOT NULL,\n  blockchain TEXT NOT NULL,\n  nodepublickey TEXT,\n  elapsedtime DOUBLE PRECISION NOT NULL,\n  bytes NUMERIC NOT NULL,\n  method TEXT,\n  message TEXT,\n  code TEXT\n);\nCREATE INDEX error_node_public_key_timestamp_idx ON error(nodepublickey, timestamp DESC);\nCREATE INDEX error_timestamp_application_public_key_idx ON error(timestamp DESC, applicationpublickey);\nCREATE INDEX error_timestamp_idx ON error(timestamp DESC);\n"` |  |
| postgresql.primary.persistence.enabled | bool | `false` |  |
| probes.enabled | bool | `true` |  |
| probes.livenessProbe.enabled | bool | `true` |  |
| probes.readinessProbe.enabled | bool | `true` |  |
| probes.startupProbe.enabled | bool | `true` |  |
| redis.architecture | string | `"standalone"` |  |
| redis.auth.enabled | bool | `false` |  |
| redis.enabled | bool | `true` |  |
| redis.fullnameOverride | string | `"redis"` |  |
| redis.master.persistence.enabled | bool | `false` |  |
| redis.replica.persistence.enabled | bool | `false` |  |
| redis.sentinel.persistence.enabled | bool | `false` |  |
| replicaCount | int | `2` |  |
| resources | object | `{}` |  |
| securityContext | object | `{}` |  |
| service.port | int | `8080` |  |
| service.type | string | `"ClusterIP"` |  |
| serviceAccount.annotations | object | `{}` |  |
| serviceAccount.create | bool | `true` |  |
| serviceAccount.name | string | `"portal-api"` |  |
| tolerations | list | `[]` |  |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.11.0](https://github.com/norwoodj/helm-docs/releases/v1.11.0)
