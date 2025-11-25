FROM alpine:3.21

ARG BUILD_DATE
ARG VCS_REF
ARG VERSION

LABEL org.opencontainers.image.created=$BUILD_DATE \
      org.opencontainers.image.title="alpine-jq" \
      org.opencontainers.image.description="Alpine with curl and jq" \
      org.opencontainers.image.url="http://andradaprieto.es" \
      org.opencontainers.image.revision=$VCS_REF \
      org.opencontainers.image.source="https://github.com/jandradap/alpine-jq" \
      org.opencontainers.image.vendor="Jorge Andrada Prieto" \
      org.opencontainers.image.version=$VERSION \
      org.opencontainers.image.authors="Jorge Andrada Prieto <jandradap@gmail.com>"

# Create a non-root user with bash shell
RUN addgroup -S appgroup && adduser -S appuser -G appgroup -s /bin/bash

# Create work directory and set permissions
RUN mkdir -p /home/appuser && chown -R appuser:appgroup /home/appuser

WORKDIR /home/appuser

RUN apk --no-cache add \
  openssl \
  bash \
  curl \
  jq

# Switch to non-root user
USER appuser
