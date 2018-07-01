FROM alpine:latest
LABEL MAINTAINER=xuvin

ENV GLIBC_PKG_VERSION=2.27-r0
ENV KEY_FILE_ANDYSHINN=andyshinn.rsa.pub
ENV KEY_FILE_SGERRAND=sgerrand.rsa.pub

WORKDIR /tmp

RUN apk update && apk upgrade

RUN apk add --no-cache --update-cache ca-certificates wget bash && \
wget -q -O /etc/apk/keys/sgerrand.rsa.pub https://raw.githubusercontent.com/sgerrand/alpine-pkg-glibc/master/sgerrand.rsa.pub && \
wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/${GLIBC_PKG_VERSION}/glibc-${GLIBC_PKG_VERSION}.apk && \
wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/${GLIBC_PKG_VERSION}/glibc-bin-${GLIBC_PKG_VERSION}.apk && \
wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/${GLIBC_PKG_VERSION}/glibc-i18n-${GLIBC_PKG_VERSION}.apk && \
apk add glibc-${GLIBC_PKG_VERSION}.apk glibc-bin-${GLIBC_PKG_VERSION}.apk glibc-i18n-${GLIBC_PKG_VERSION}.apk && \
rm -rf /tmp/*

#CMD ["/bin/bash"]