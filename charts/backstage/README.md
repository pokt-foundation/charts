# backstage

![Version: 0.1.4](https://img.shields.io/badge/Version-0.1.4-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: v0.1.1-alpha.23](https://img.shields.io/badge/AppVersion-v0.1.1--alpha.23-informational?style=flat-square)

A Helm chart for Backstage

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| GustavoBelfort |  |  |
| pokt-foundation |  |  |

## Source Code

* <https://github.com/backstage/backstage>
* <https://github.com/spotify/lighthouse-audit-service>

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| https://charts.bitnami.com/bitnami | postgresql | 11.8.0 |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| appConfig.app.baseUrl | string | `"https://backstage.tooling.pokt.network"` |  |
| appConfig.app.googleAnalyticsTrackingId | string | `nil` |  |
| appConfig.app.title | string | `"Backstage"` |  |
| appConfig.auth.providers.auth0.development.clientId | string | `"${AUTH_AUTH0_CLIENT_ID}"` |  |
| appConfig.auth.providers.auth0.development.clientSecret | string | `"${AUTH_AUTH0_CLIENT_SECRET}"` |  |
| appConfig.auth.providers.auth0.development.domain | string | `"${AUTH_AUTH0_DOMAIN}"` |  |
| appConfig.auth.providers.github.development.appOrigin | string | `"http://localhost:3000/"` |  |
| appConfig.auth.providers.github.development.clientId | string | `"${AUTH_GITHUB_CLIENT_ID}"` |  |
| appConfig.auth.providers.github.development.clientSecret | string | `"${AUTH_GITHUB_CLIENT_SECRET}"` |  |
| appConfig.auth.providers.github.development.enterpriseInstanceUrl | string | `"${AUTH_GITHUB_ENTERPRISE_INSTANCE_URL}"` |  |
| appConfig.auth.providers.github.development.secure | bool | `false` |  |
| appConfig.auth.providers.gitlab.development.appOrigin | string | `"http://localhost:3000/"` |  |
| appConfig.auth.providers.gitlab.development.audience | string | `"${GITLAB_BASE_URL}"` |  |
| appConfig.auth.providers.gitlab.development.clientId | string | `"${AUTH_GITLAB_CLIENT_ID}"` |  |
| appConfig.auth.providers.gitlab.development.clientSecret | string | `"${AUTH_GITLAB_CLIENT_SECRET}"` |  |
| appConfig.auth.providers.gitlab.development.secure | bool | `false` |  |
| appConfig.auth.providers.google.development.appOrigin | string | `"http://localhost:3000/"` |  |
| appConfig.auth.providers.google.development.clientId | string | `"${AUTH_GOOGLE_CLIENT_ID}"` |  |
| appConfig.auth.providers.google.development.clientSecret | string | `"${AUTH_GOOGLE_CLIENT_SECRET}"` |  |
| appConfig.auth.providers.google.development.secure | bool | `false` |  |
| appConfig.auth.providers.microsoft.development.clientId | string | `"${AUTH_MICROSOFT_CLIENT_ID}"` |  |
| appConfig.auth.providers.microsoft.development.clientSecret | string | `"${AUTH_MICROSOFT_CLIENT_SECRET}"` |  |
| appConfig.auth.providers.microsoft.development.tenantId | string | `"${AUTH_MICROSOFT_TENANT_ID}"` |  |
| appConfig.auth.providers.oauth2.development.appOrigin | string | `"http://localhost:3000/"` |  |
| appConfig.auth.providers.oauth2.development.authorizationURL | string | `"${AUTH_OAUTH2_AUTH_URL}"` |  |
| appConfig.auth.providers.oauth2.development.clientId | string | `"${AUTH_OAUTH2_CLIENT_ID}"` |  |
| appConfig.auth.providers.oauth2.development.clientSecret | string | `"${AUTH_OAUTH2_CLIENT_SECRET}"` |  |
| appConfig.auth.providers.oauth2.development.secure | bool | `false` |  |
| appConfig.auth.providers.oauth2.development.tokenURL | string | `"${AUTH_OAUTH2_TOKEN_URL}"` |  |
| appConfig.auth.providers.okta.development.appOrigin | string | `"http://localhost:3000/"` |  |
| appConfig.auth.providers.okta.development.audience | string | `"${AUTH_OKTA_AUDIENCE}"` |  |
| appConfig.auth.providers.okta.development.clientId | string | `"${AUTH_OKTA_CLIENT_ID}"` |  |
| appConfig.auth.providers.okta.development.clientSecret | string | `"${AUTH_OKTA_CLIENT_SECRET}"` |  |
| appConfig.auth.providers.okta.development.secure | bool | `false` |  |
| appConfig.backend.baseUrl | string | `"https://backstage.tooling.pokt.network"` |  |
| appConfig.backend.cors.origin | string | `"https://backstage.tooling.pokt.network"` |  |
| appConfig.backend.database.client | string | `"pg"` |  |
| appConfig.backend.database.connection.database | string | `"backstage_plugin_catalog"` |  |
| appConfig.backend.database.connection.host | string | `nil` |  |
| appConfig.backend.database.connection.password | string | `nil` |  |
| appConfig.backend.database.connection.port | string | `nil` |  |
| appConfig.backend.database.connection.ssl.ca | string | `nil` |  |
| appConfig.backend.database.connection.ssl.rejectUnauthorized | bool | `false` |  |
| appConfig.backend.database.connection.user | string | `nil` |  |
| appConfig.backend.listen.port | int | `7007` |  |
| appConfig.lighthouse.baseUrl | string | `"https://backstage.tooling.pokt.network/lighthouse-api"` |  |
| appConfig.rollbar.organization | string | `"example-org-name"` |  |
| appConfig.sentry.organization | string | `"example-org-name"` |  |
| appConfig.techdocs.requestUrl | string | `"https://backstage.tooling.pokt.network/api/techdocs"` |  |
| appConfig.techdocs.storageUrl | string | `"https://backstage.tooling.pokt.network/api/techdocs/static/docs"` |  |
| auth.auth0.clientId | string | `"b"` |  |
| auth.auth0.clientSecret | string | `"b"` |  |
| auth.auth0.domain | string | `"b"` |  |
| auth.azure.api.token | string | `"h"` |  |
| auth.circleciAuthToken | string | `"r"` |  |
| auth.github.clientId | string | `"c"` |  |
| auth.github.clientSecret | string | `"c"` |  |
| auth.githubToken | string | `"g"` |  |
| auth.gitlab.baseUrl | string | `"b"` |  |
| auth.gitlab.clientId | string | `"b"` |  |
| auth.gitlab.clientSecret | string | `"b"` |  |
| auth.gitlabToken | string | `"g"` |  |
| auth.google.clientId | string | `"a"` |  |
| auth.google.clientSecret | string | `"a"` |  |
| auth.microsoft.clientId | string | `"f"` |  |
| auth.microsoft.clientSecret | string | `"f"` |  |
| auth.microsoft.tenantId | string | `"f"` |  |
| auth.newRelicRestApiKey | string | `"r"` |  |
| auth.oauth2.authUrl | string | `"b"` |  |
| auth.oauth2.clientId | string | `"b"` |  |
| auth.oauth2.clientSecret | string | `"b"` |  |
| auth.oauth2.tokenUrl | string | `"b"` |  |
| auth.okta.audience | string | `"b"` |  |
| auth.okta.clientId | string | `"b"` |  |
| auth.okta.clientSecret | string | `"b"` |  |
| auth.pagerdutyToken | string | `"h"` |  |
| auth.rollbarAccountToken | string | `"f"` |  |
| auth.sentryToken | string | `"e"` |  |
| auth.travisciAuthToken | string | `"fake-travis-ci-auth-token"` |  |
| backend.containerPort | int | `7007` |  |
| backend.demoData | bool | `true` |  |
| backend.enabled | bool | `false` |  |
| backend.image.pullPolicy | string | `"IfNotPresent"` |  |
| backend.image.repository | string | `"martinaif/backstage-k8s-demo-backend"` |  |
| backend.image.tag | string | `"20210423T1550"` |  |
| backend.nodeEnv | string | `"development"` |  |
| backend.postgresCertMountEnabled | bool | `false` |  |
| backend.postgresql.passwordSecret | string | `"postgresql-password"` |  |
| backend.replicaCount | int | `1` |  |
| backend.resources.limits.memory | string | `"1024Mi"` |  |
| backend.resources.requests.memory | string | `"512Mi"` |  |
| backend.serviceType | string | `"ClusterIP"` |  |
| externalSecrets.authMountPath | string | `"k8s-tooling-us-east-1"` |  |
| externalSecrets.controller | string | `""` |  |
| externalSecrets.deletionPolicy | string | `"Delete"` |  |
| externalSecrets.enabled | bool | `false` |  |
| externalSecrets.namespace | string | `"admin/engineering/"` |  |
| externalSecrets.refreshInterval | string | `"0"` |  |
| externalSecrets.role | string | `"backstage"` |  |
| externalSecrets.secretKey | string | `"backstage/app-config.yaml"` |  |
| externalSecrets.secretStoretPath | string | `"devops/"` |  |
| externalSecrets.targetName | string | `"backstage"` |  |
| externalSecrets.vaultServer | string | `"https://hcp-vault-cluster-a-public-vault-72230702.bb94b393.z1.hashicorp.cloud:8200"` |  |
| externalSecrets.version | string | `"v1"` |  |
| frontend.containerPort | int | `80` |  |
| frontend.enabled | bool | `false` |  |
| frontend.image.pullPolicy | string | `"IfNotPresent"` |  |
| frontend.image.repository | string | `"martinaif/backstage-k8s-demo-frontend"` |  |
| frontend.image.tag | string | `"test1"` |  |
| frontend.replicaCount | int | `1` |  |
| frontend.resources.limits.memory | string | `"256Mi"` |  |
| frontend.resources.requests.memory | string | `"128Mi"` |  |
| frontend.serviceType | string | `"ClusterIP"` |  |
| fullnameOverride | string | `""` |  |
| global.nodeSelector | object | `{}` |  |
| global.postgresql.caFilename | string | `"ca.crt"` |  |
| global.postgresql.postgresqlUsername | string | `"postgres"` |  |
| ingress.annotations."kubernetes.io/ingress.class" | string | `"nginx"` |  |
| issuer.clusterIssuer | string | `"letsencrypt-staging"` |  |
| issuer.email | string | `nil` |  |
| lighthouse.containerPort | int | `3003` |  |
| lighthouse.database.connection.database | string | `"lighthouse_audit_service"` |  |
| lighthouse.database.connection.host | string | `nil` |  |
| lighthouse.database.connection.password | string | `nil` |  |
| lighthouse.database.connection.port | string | `nil` |  |
| lighthouse.database.connection.user | string | `nil` |  |
| lighthouse.database.pathToDatabaseCa | string | `nil` |  |
| lighthouse.enabled | bool | `false` |  |
| lighthouse.image.pullPolicy | string | `"IfNotPresent"` |  |
| lighthouse.image.repository | string | `"roadiehq/lighthouse-audit-service"` |  |
| lighthouse.image.tag | string | `"latest"` |  |
| lighthouse.postgresCertMountEnabled | bool | `true` |  |
| lighthouse.replicaCount | int | `1` |  |
| lighthouse.resources.limits.memory | string | `"256Mi"` |  |
| lighthouse.resources.requests.memory | string | `"128Mi"` |  |
| lighthouse.serviceType | string | `"ClusterIP"` |  |
| nameOverride | string | `""` |  |
| postgresql.enabled | bool | `true` |  |
| postgresql.initdbScriptsSecret | string | `"backstage-postgresql-initdb"` |  |
| postgresql.nameOverride | string | `"postgresql"` |  |
| postgresql.service.port | int | `5432` |  |
| postgresql.tls.certFilename | string | `"tls.crt"` |  |
| postgresql.tls.certKeyFilename | string | `"tls.key"` |  |
| postgresql.tls.certificatesSecret | string | `"backstage-postgresql-certs"` |  |
| postgresql.tls.enabled | bool | `false` |  |
| postgresql.volumePermissions.enabled | bool | `true` |  |
| serviceAccount.create | bool | `true` |  |
| serviceAccount.name | string | `"backstage"` |  |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.11.0](https://github.com/norwoodj/helm-docs/releases/v1.11.0)
