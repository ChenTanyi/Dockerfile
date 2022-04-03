#!/bin/sh
set -e

mkdir -p /tmp/v2ray
cd /tmp/v2ray
wget https://github.com/chentanyi/v2release/releases/latest/download/v2ray-${TARGETOS}-${TARGETARCH}${TARGETVARIANT}.tar.xz
tar xJf v2ray-${TARGETOS}-${TARGETARCH}${TARGETVARIANT}.tar.xz -C /usr/local/bin
cd /
rm -rf /tmp/v2ray

set -a
# ACCESS_LOG="/var/log/v2ray/access.log"
# ERROR_LOG="/var/log/v2ray/error.log"
LOG_LEVEL=${LOG_LEVEL:-error}
PROTOCOL=${PROTOCOL:-vless}
REQ_PATH="${REQ_PATH%/}/"
REQ_PATH="${REQ_PATH#/}"
PORTAL_PATH=${PORTAL_PATH:-portal}
PORTAL_PATH="${PORTAL_PATH%/}/"
PORTAL_PATH="${PORTAL_PATH#/}"
set +a

ALL_ENV='$PORT $REQ_PATH $PORTAL_PATH $UUID $PROTOCOL $LOG_LEVEL $ACCESS_LOG $ERROR_LOG'
envsubst "$ALL_ENV" < /usr/local/etc/v2ray/config.json.template > /usr/local/etc/v2ray/config.json
envsubst "$ALL_ENV" < /etc/nginx/nginx.conf.template > /etc/nginx/nginx.conf
sed -i "s/env:PORT/58000/g" /usr/local/etc/v2ray/config.json

mkdir -p /var/log/v2ray/
/usr/local/bin/v2ray -test -c /usr/local/etc/v2ray/config.json
/usr/local/bin/v2ray -c /usr/local/etc/v2ray/config.json &
