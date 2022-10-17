backend:
  listen:
      port: {{ .Values.appConfig.backend.listen.port | default 7007 }}
  database:
    client: {{ .Values.appConfig.backend.database.client | quote }}
    connection:
      host: {{ include "backend.postgresql.host" . | quote }}
      port: {{ include "backend.postgresql.port" . | quote }}
      user: {{ include "backend.postgresql.user" . | quote }}
      database: {{ .Values.appConfig.backend.database.connection.database | quote }}
  csp:
    connect-src: ["'self'", 'http:', 'https:']
    img-src: ["'self'", 'http:', 'https:']

catalog:
  locations: []
