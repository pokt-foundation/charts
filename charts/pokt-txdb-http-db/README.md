# pokt-txdb-http-db

![Version: 0.0.1](https://img.shields.io/badge/Version-0.0.1-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 0.0.1](https://img.shields.io/badge/AppVersion-0.0.1-informational?style=flat-square)

A Helm chart for deploying the POKT HTTP DB service

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| hebertcl |  |  |
| pokt-foundation |  |  |

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| https://charts.bitnami.com/bitnami | postgresql | 12.1.0 |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| affinity | object | `{}` |  |
| autoscaling.enabled | bool | `false` |  |
| autoscaling.maxReplicas | int | `100` |  |
| autoscaling.minReplicas | int | `3` |  |
| autoscaling.targetCPUUtilizationPercentage | int | `80` |  |
| autoscaling.targetMemoryUtilizationPercentage | int | `80` |  |
| env.normal.API_KEYS | string | `"dummyvalue"` |  |
| env.normal.CACHE_REFRESH | int | `180` |  |
| env.normal.CONNECTION_STRING | string | `"postgres://pokt:P0K7p05tgr3s8@postgres-httpdb:5432/phd?sslmode=disable"` |  |
| env.normal.PORT | int | `80` |  |
| env.secret | list | `[]` |  |
| externalSecrets.enabled | bool | `false` |  |
| fullnameOverride | string | `""` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.repository | string | `"pocketfoundation/pocket-http-db"` |  |
| image.tag | string | `"master"` |  |
| imagePullSecrets | list | `[]` |  |
| ingress.annotations | object | `{}` |  |
| ingress.className | string | `""` |  |
| ingress.enabled | bool | `false` |  |
| ingress.hosts[0].host | string | `"mydomain.com"` |  |
| ingress.hosts[0].paths[0].path | string | `"/"` |  |
| ingress.hosts[0].paths[0].pathType | string | `"ImplementationSpecific"` |  |
| ingress.tls[0].hosts[0] | string | `"mydomain.com"` |  |
| ingress.tls[0].secretName | string | `"mydomain-com-tls"` |  |
| nameOverride | string | `""` |  |
| nodeSelector | object | `{}` |  |
| podAnnotations | object | `{}` |  |
| podSecurityContext | object | `{}` |  |
| postgresql.architecture | string | `"standalone"` |  |
| postgresql.auth.database | string | `"phd"` |  |
| postgresql.auth.password | string | `"P0K7p05tgr3s8"` |  |
| postgresql.auth.username | string | `"pokt"` |  |
| postgresql.enabled | bool | `true` |  |
| postgresql.fullnameOverride | string | `"postgres-httpdb"` |  |
| postgresql.primary.initdb.scripts."00_db_init_script.sql.sql" | string | `"-- Pay Plans\nCREATE TABLE IF NOT EXISTS pay_plans (\n  id INT GENERATED ALWAYS AS IDENTITY,\n  plan_type VARCHAR NOT NULL UNIQUE,\n  daily_limit INT NOT NULL,\n  PRIMARY KEY (plan_type)\n);\n\n-- Blockchains\nCREATE TABLE IF NOT EXISTS blockchains (\n  id INT GENERATED ALWAYS AS IDENTITY,\n  blockchain_id VARCHAR NOT NULL UNIQUE,\n  active BOOLEAN,\n  altruist VARCHAR,\n  blockchain VARCHAR,\n  blockchain_aliases VARCHAR[],\n  chain_id VARCHAR,\n  chain_id_check VARCHAR,\n  description VARCHAR,\n  enforce_result VARCHAR,\n  log_limit_blocks INT,\n  network VARCHAR,\n  path VARCHAR,\n  request_timeout INT,\n  ticker VARCHAR,\n  created_at TIMESTAMP NULL,\n  updated_at TIMESTAMP NULL,\n  PRIMARY KEY (blockchain_id)\n);\n\nCREATE TABLE IF NOT EXISTS redirects (\n  id INT GENERATED ALWAYS AS IDENTITY,\n  blockchain_id VARCHAR NOT NULL,\n  alias VARCHAR NOT NULL,\n  loadbalancer VARCHAR NOT NULL,\n  domain VARCHAR NOT NULL,\n  created_at TIMESTAMP NULL,\n  updated_at TIMESTAMP NULL,\n  UNIQUE (blockchain_id, domain),\n  PRIMARY KEY (id),\n  CONSTRAINT fk_blockchain\n      FOREIGN KEY(blockchain_id)\n      REFERENCES blockchains(blockchain_id)\n);\n\nCREATE TABLE IF NOT EXISTS sync_check_options (\n  id INT GENERATED ALWAYS AS IDENTITY,\n  blockchain_id VARCHAR NOT NULL UNIQUE,\n  syncCheck VARCHAR,\n  allowance INT,\n  body VARCHAR,\n  path VARCHAR,\n  result_key VARCHAR,\n  PRIMARY KEY (id),\n  CONSTRAINT fk_blockchain\n      FOREIGN KEY(blockchain_id)\n      REFERENCES blockchains(blockchain_id)\n);\n\n-- Load Balancers\nCREATE TABLE IF NOT EXISTS loadbalancers (\n  id INT GENERATED ALWAYS AS IDENTITY,\n  lb_id VARCHAR NOT NULL UNIQUE,\n  user_id VARCHAR,\n  name VARCHAR,\n  request_timeout INT,\n  gigastake BOOLEAN,\n  gigastake_redirect BOOLEAN,\n  created_at TIMESTAMP NULL,\n  updated_at TIMESTAMP NULL,\n  PRIMARY KEY (id)\n);\n\nCREATE TABLE IF NOT EXISTS stickiness_options (\n  id INT GENERATED ALWAYS AS IDENTITY,\n  lb_id VARCHAR NOT NULL UNIQUE,\n  duration TEXT,\n  sticky_max INT,\n  stickiness BOOLEAN,\n  origins VARCHAR[],\n  PRIMARY KEY (id),\n  CONSTRAINT fk_lb\n      FOREIGN KEY(lb_id)\n      REFERENCES loadbalancers(lb_id)\n);\n\n-- Applications\nCREATE TABLE IF NOT EXISTS applications (\n  id INT GENERATED ALWAYS AS IDENTITY,\n  application_id VARCHAR NOT NULL UNIQUE,\n  contact_email VARCHAR,\n  description TEXT,\n  name VARCHAR,\n  status VARCHAR,\n  -- TODO remove deprecated field once database updated\n  pay_plan_type VARCHAR,\n  owner VARCHAR,\n  url VARCHAR,\n  user_id VARCHAR,\n  dummy BOOLEAN,\n  first_date_surpassed TIMESTAMP NULL,\n  created_at TIMESTAMP NULL,\n  updated_at TIMESTAMP NULL,\n  PRIMARY KEY (application_id)\n);\n\nCREATE TABLE IF NOT EXISTS app_limits (\n  id INT GENERATED ALWAYS AS IDENTITY,\n  application_id VARCHAR NOT NULL UNIQUE,\n  pay_plan VARCHAR NOT NULL,\n  custom_limit INT NULL,\n  PRIMARY KEY (id),\n  CONSTRAINT fk_application\n      FOREIGN KEY(application_id)\n      REFERENCES applications(application_id),\n  CONSTRAINT fk_pay_plan\n      FOREIGN KEY(pay_plan)\n      REFERENCES pay_plans(plan_type)\n);\n\nCREATE TABLE IF NOT EXISTS gateway_aat (\n  id INT GENERATED ALWAYS AS IDENTITY,\n  application_id VARCHAR NOT NULL UNIQUE,\n  address VARCHAR NOT NULL,\n  public_key VARCHAR NOT NULL,\n  private_key VARCHAR,\n  signature VARCHAR NOT NULL,\n  client_public_key VARCHAR NOT NULL,\n  version VARCHAR,\n  PRIMARY KEY (id),\n  CONSTRAINT fk_application\n      FOREIGN KEY(application_id)\n      REFERENCES applications(application_id)\n);\n\nCREATE TABLE IF NOT EXISTS gateway_settings (\n  id INT GENERATED ALWAYS AS IDENTITY,\n  application_id VARCHAR NOT NULL UNIQUE,\n  secret_key VARCHAR,\n  secret_key_required BOOLEAN,\n  whitelist_blockchains VARCHAR[],\n  whitelist_contracts VARCHAR,\n  whitelist_methods VARCHAR,\n  whitelist_origins VARCHAR[],\n  whitelist_user_agents VARCHAR[],\n  PRIMARY KEY (id),\n  CONSTRAINT fk_application\n      FOREIGN KEY(application_id)\n      REFERENCES applications(application_id)\n);\n\nCREATE TABLE IF NOT EXISTS notification_settings (\n  id INT GENERATED ALWAYS AS IDENTITY,\n  application_id VARCHAR NOT NULL UNIQUE,\n  signed_up BOOLEAN,\n  on_quarter BOOLEAN,\n  on_half BOOLEAN,\n  on_three_quarters BOOLEAN,\n  on_full BOOLEAN,\n  PRIMARY KEY (id),\n  CONSTRAINT fk_application\n      FOREIGN KEY(application_id)\n      REFERENCES applications(application_id)\n);\n\n-- Load Balancer-Apps Join Table\nCREATE TABLE IF NOT EXISTS lb_apps (\n  id INT GENERATED ALWAYS AS IDENTITY,\n  lb_id VARCHAR NOT NULL,\n  app_id VARCHAR NOT NULL,\n  UNIQUE(lb_id, app_id),\n  PRIMARY KEY (id),\n  CONSTRAINT fk_lb\n      FOREIGN KEY(lb_id)\n      REFERENCES loadbalancers(lb_id),\n  CONSTRAINT fk_app\n      FOREIGN KEY(app_id)\n      REFERENCES applications(application_id)\n);\n\n-- Insert Rows\nINSERT INTO pay_plans (plan_type, daily_limit)\nVALUES\n    ('FREETIER_V0', 250000),\n    ('PAY_AS_YOU_GO_V0', 0),\n    ('ENTERPRISE', 0),\n    ('TEST_PLAN_V0', 100),\n    ('TEST_PLAN_10K', 10000),\n    ('TEST_PLAN_90K', 90000);\n\nCREATE OR REPLACE FUNCTION notify_event() RETURNS TRIGGER AS $$\n\n    DECLARE\n        data json;\n        notification json;\n\n    BEGIN\n\n        -- Convert the old or new row to JSON, based on the kind of action.\n        -- Action = DELETE?             -> OLD row\n        -- Action = INSERT or UPDATE?   -> NEW row\n        IF (TG_OP = 'DELETE') THEN\n            data = row_to_json(OLD);\n        ELSE\n            data = row_to_json(NEW);\n        END IF;\n\n        -- Contruct the notification as a JSON string.\n        notification = json_build_object(\n                          'table',TG_TABLE_NAME,\n                          'action', TG_OP,\n                          'data', data);\n\n\n        -- Execute pg_notify(channel, notification)\n        PERFORM pg_notify('events',notification::text);\n\n        -- Result is ignored since this is an AFTER trigger\n        RETURN NULL;\n    END;\n\n$$ LANGUAGE plpgsql;\n\nCREATE TRIGGER loadbalancer_notify_event\nAFTER INSERT OR UPDATE ON loadbalancers\n    FOR EACH ROW EXECUTE PROCEDURE notify_event();\nCREATE TRIGGER stickiness_options_notify_event\nAFTER INSERT OR UPDATE ON stickiness_options\n    FOR EACH ROW EXECUTE PROCEDURE notify_event();\n\nCREATE TRIGGER lb_apps_notify_event\nAFTER INSERT ON lb_apps\n    FOR EACH ROW EXECUTE PROCEDURE notify_event();\n\nCREATE TRIGGER application_notify_event\nAFTER INSERT OR UPDATE ON applications\n    FOR EACH ROW EXECUTE PROCEDURE notify_event();\nCREATE TRIGGER app_limits_notify_event\nAFTER INSERT OR UPDATE ON app_limits\n    FOR EACH ROW EXECUTE PROCEDURE notify_event();\nCREATE TRIGGER gateway_aat_notify_event\nAFTER INSERT ON gateway_aat\n    FOR EACH ROW EXECUTE PROCEDURE notify_event();\nCREATE TRIGGER gateway_settings_notify_event\nAFTER INSERT OR UPDATE ON gateway_settings\n    FOR EACH ROW EXECUTE PROCEDURE notify_event();\nCREATE TRIGGER notification_settings_notify_event\nAFTER INSERT OR UPDATE ON notification_settings\n    FOR EACH ROW EXECUTE PROCEDURE notify_event();\n\nCREATE TRIGGER blockchain_notify_event\nAFTER INSERT OR UPDATE ON blockchains\n    FOR EACH ROW EXECUTE PROCEDURE notify_event();\nCREATE TRIGGER redirect_notify_event\nAFTER INSERT ON redirects\n    FOR EACH ROW EXECUTE PROCEDURE notify_event();\nCREATE TRIGGER sync_check_options_notify_event\nAFTER INSERT ON sync_check_options\n    FOR EACH ROW EXECUTE PROCEDURE notify_event();\n"` |  |
| postgresql.primary.persistence.enabled | bool | `false` |  |
| probes.enabled | bool | `false` |  |
| replicaCount | int | `1` |  |
| resources | object | `{}` |  |
| securityContext | object | `{}` |  |
| service.port | int | `80` |  |
| service.type | string | `"ClusterIP"` |  |
| serviceAccount.annotations | object | `{}` |  |
| serviceAccount.create | bool | `true` |  |
| serviceAccount.name | string | `"pokt-txdb-http-db"` |  |
| tolerations | list | `[]` |  |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.11.0](https://github.com/norwoodj/helm-docs/releases/v1.11.0)
