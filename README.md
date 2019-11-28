# docker-xteve

[![Image Layers Badge](https://images.microbadger.com/badges/image/tnwhitwell/xteve.svg)](https://microbadger.com/images/tnwhitwell/xteve)
[![Image current commit Badge](https://images.microbadger.com/badges/commit/tnwhitwell/xteve.svg)](https://microbadger.com/images/tnwhitwell/xteve)
[![CI Status Badge](https://concourse.whitwell.dev/api/v1/pipelines/docker-xteve/jobs/Build/badge)](https://concourse.whitwell.dev/teams/main/pipelines/docker-xteve)

## Usage

```shell
export PUID=99
export PGID=100
docker run \
    -v /path/to/config:/config \
    -v /tmp/xteve:/tmp/xteve \
    -p 34400:34400 \
    -u ${PUID}:${PGID}
    tnwhitwell/xteve:latest
```

```yaml
version: '3'
services:
  xteve:
    image: tnwhitwell/xteve:latest
    ports:
      - "34400:34400"
    volumes:
      - "/path/to/config:/config"
      - "/tmp/xteve:/tmp/xteve"
    user: "${PUID}:${PGID}"
```

By default, the process runs as user `root:root`. It is recommended to change this using the `-u UID:GID` option in the docker run command, or with `user: UID:GID` in a docker-compose file.

Documentation for xteve itself can be [found on its github page](https://github.com/xteve-project/xTeVe-Documentation/blob/master/en/configuration.md). ffmpeg and cvlc are available within the docker image, so they can be used as buffers.

## Source

[whi-tw/docker-xteve](https://github.com/whi-tw/docker-xteve)
