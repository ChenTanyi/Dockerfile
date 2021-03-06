#!/bin/sh
set -e

mkdir -p /tmp/v2ray
cd /tmp/v2ray
wget https://github.com/chentanyi/v2release/releases/latest/download/v2ray-${TARGETOS}-${TARGETARCH}${TARGETVARIANT}.tar.xz
tar xJf v2ray-${TARGETOS}-${TARGETARCH}${TARGETVARIANT}.tar.xz -C /usr/local/bin
cd /
rm -rf /tmp/v2ray

export PROTOCOL=${PROTOCOL:-vless}
export REQ_PATH="${REQ_PATH%/}/"

ALL_ENV='$PORT $REQ_PATH $UUID $PROTOCOL'
envsubst "$ALL_ENV" < /usr/local/etc/v2ray/config.json.template > /usr/local/etc/v2ray/config.json
envsubst "$ALL_ENV" < /etc/nginx/nginx.conf.template > /etc/nginx/nginx.conf
sed -i "s/env:PORT/8000/g" /usr/local/etc/v2ray/config.json

mkdir -p /var/log/v2ray/
/usr/local/bin/v2ray -test -c /usr/local/etc/v2ray/config.json
/usr/local/bin/v2ray -c /usr/local/etc/v2ray/config.json &
