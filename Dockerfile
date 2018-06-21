FROM openjdk:8-alpine
LABEL maintainer="mario.siegenthaler@linkyard.ch"

RUN apk --no-cache add \
  bash vim \
  curl ca-certificates \
  postgresql

RUN mkdir -p /opt/restore && \
  curl -L https://marketplace.atlassian.com/download/apps/1211500/version/300300410 -o /opt/restore/backup-client.zip && \
  unzip /opt/restore/backup-client.zip -d /opt/restore && \
  mv /opt/restore/bitbucket-backup-client-*/* /opt/restore/ && \
  rm /opt/restore/backup-client.zip

RUN mkdir -p /data

VOLUME [ "/data/home" ]

RUN [ "/bin/bash" ]
