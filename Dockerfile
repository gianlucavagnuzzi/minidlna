
## https://hub.docker.com/_/alpine/tags
FROM alpine:3.23.3

## https://pkgs.alpinelinux.org/packages?name=minidlna&branch=v3.23&repo=&arch=x86_64&origin=&flagged=&maintainer=
ENV minidlnaV="minidlna=~1.3.3-r3"

LABEL org.opencontainers.image.authors="kom23 <vagnu00@gmail.com>"
LABEL Description="Minidlna server based on Alpine."

ENV APP_NAME="minidlna"

RUN set -xe && \
  : "---------- ESSENTIAL packages INSTALLATION ----------" && \
  apk update --no-cache && \
  apk upgrade --available && \
  apk add bash

RUN set -xe && \
  : "---------- SPECIFIC packages INSTALLATION ----------" && \
  apk update --no-cache && \
  apk add --upgrade ${minidlnaV}

ADD rootfs /

ENTRYPOINT ["/entrypoint.sh"]
CMD ["/usr/sbin/minidlnad", "-S"]

