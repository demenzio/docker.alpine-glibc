FROM alpine:latest
LABEL MAINTAINER=xuvin

ARG GLIBC_PKG_VERSION=2.29-r0

WORKDIR /tmp

RUN apk update && apk upgrade

RUN apk add --no-cache --update-cache ca-certificates wget bash && \
wget -q -O /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub && \
wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/${GLIBC_PKG_VERSION}/glibc-${GLIBC_PKG_VERSION}.apk && \
wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/${GLIBC_PKG_VERSION}/glibc-bin-${GLIBC_PKG_VERSION}.apk && \
wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/${GLIBC_PKG_VERSION}/glibc-i18n-${GLIBC_PKG_VERSION}.apk && \
apk add glibc-${GLIBC_PKG_VERSION}.apk glibc-bin-${GLIBC_PKG_VERSION}.apk glibc-i18n-${GLIBC_PKG_VERSION}.apk && \
/usr/glibc-compat/bin/localedef -i en_US -f UTF-8 en_US.UTF-8 && \
rm -rf /tmp/*

#CMD ["/bin/bash"]