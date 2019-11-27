FROM alpine:latest AS extract

RUN apk add --no-cache \
        ca-certificates \
        tzdata

COPY xteve_linux_amd64.tar.gz /source/

WORKDIR /source

RUN tar xzf xteve_linux_amd64.tar.gz

FROM scratch
ARG XTEVE_VERSION
ARG XTEVE_COMMIT_REF
ARG DOCKER_XTEVE_COMMIT_REF
ARG BUILD_TIME
ARG BUILD_CI_URL

LABEL org.label-schema.build-date=${BUILD_TIME} \
      org.label-schema.vcs-ref=${XTEVE_COMMIT_REF} \
      org.label-schema.vcs-url="https://github.com/xteve-project/xTeVe-Downloads" \
      org.label-schema.schema-version="1.0" \
      docker-build.vcs-ref=${DOCKER_XTEVE_COMMIT_REF} \
      docker-build.vcs-url="https://github.com/whi-tw/docker-xteve" \
      docker-build.ci-url="${BUILD_CI_URL}" \
      maintainer="tom@whi.tw"

COPY --from=extract /usr/share/zoneinfo /usr/share/zoneinfo
COPY --from=extract /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/

WORKDIR /xteve
COPY --from=extract /source/xteve xteve

VOLUME ["/config", "/tmp/xteve"]

EXPOSE 34400
ENTRYPOINT [ "/xteve/xteve" ]
CMD [ "-config", "/config" ]
