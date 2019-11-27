ARG ALPINE_VERSION
FROM alpine:${ALPINE_VERSION} AS extract

COPY xteve_linux_amd64.tar.gz /source/

WORKDIR /source

RUN tar xzf xteve_linux_amd64.tar.gz

FROM alpine:${ALPINE_VERSION}

ARG XTEVE_VERSION
ARG XTEVE_COMMIT_REF
ARG DOCKER_XTEVE_COMMIT_REF
ARG BUILD_TIME
ARG BUILD_CI_URL

LABEL org.label-schema.build-date="${BUILD_TIME}" \
      org.label-schema.vcs-ref="${XTEVE_COMMIT_REF}" \
      org.label-schema.vcs-url="https://github.com/xteve-project/xTeVe-Downloads" \
      org.label-schema.version="${XTEVE_VERSION}" \
      org.label-schema.schema-version="1.0" \
      docker-build.vcs-ref="${DOCKER_XTEVE_COMMIT_REF}" \
      docker-build.vcs-url="https://github.com/whi-tw/docker-xteve" \
      docker-build.ci-url="${BUILD_CI_URL}" \
      maintainer="tom@whi.tw"

RUN apk add --no-cache \
        ca-certificates \
        tzdata \
        ffmpeg \
        vlc \
    && update-ca-certificates

WORKDIR /xteve
COPY --from=extract /source/xteve xteve

VOLUME ["/config", "/tmp/xteve"]

EXPOSE 34400
ENTRYPOINT [ "/xteve/xteve" ]
CMD [ "-config", "/config" ]
