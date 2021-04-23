#!/bin/sh
set -e

wget https://github.com/chentanyi/v2release/releases/latest/download/v2ray-${TARGETOS}-${TARGETARCH}${TARGETVARIANT} -O /usr/local/bin/v2ray
wget https://github.com/chentanyi/v2release/releases/latest/download/v2ctl-${TARGETOS}-${TARGETARCH}${TARGETVARIANT} -O /usr/local/bin/v2ctl
chmod +x /usr/local/bin/v2ray /usr/local/bin/v2ctl

export PROTOCOL=${PROTOCOL:-vless}

ALL_ENV='$REQ_PATH $UUID $PROTOCOL'
envsubst "$ALL_ENV" < /usr/local/etc/v2ray/config.json.template > /usr/local/etc/v2ray/config.json
envsubst "$ALL_ENV" < /etc/nginx/nginx.conf.template > /etc/nginx/nginx.conf

mkdir -p /var/log/v2ray/
/usr/local/bin/v2ray -test -c /usr/local/etc/v2ray/config.json
/usr/local/bin/v2ray -c /usr/local/etc/v2ray/config.json &
