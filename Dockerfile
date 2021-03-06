ARG PKG="wget gcc make binutils libc6-compat g++ openssl-dev openssl curl curl-dev git"
ARG VER="5.2.1.1"
ARG UID=10000

FROM alpine:3.13.5

ARG PKG
ARG VER
ARG UID

COPY ./config.settings /tmp/config.settings

WORKDIR /usr/src/ircd
RUN set -x \
    && apk add --no-cache --virtual build ${PKG} && apk add --no-cache libcurl \
    && git clone https://github.com/pissnet/pissircd.git source \
    && cd source \
    && cp /tmp/config.settings /usr/src/ircd/source/config.settings \
    && ./Config -quick \
    && make -j$(nproc) && make install \
    && rm -rf /usr/src/ircd \
    && apk del build \
    && addgroup -S unreal && adduser -u ${UID} -S unreal -G unreal

WORKDIR /ircd
RUN set -x \
    && chown -R unreal:unreal /ircd /app

USER unreal

CMD ["/app/unrealircd/bin/unrealircd", "-F"]