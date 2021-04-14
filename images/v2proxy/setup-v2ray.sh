#!/bin/sh
set -e

export PROTOCOL=${PROTOCOL:-vless}

ALL_ENV='$REQ_PATH $UUID $PROTOCOL'
envsubst "$ALL_ENV" < /usr/local/etc/v2ray/config.json.template > /usr/local/etc/v2ray/config.json
envsubst "$ALL_ENV" < /etc/nginx/nginx.conf.template > /etc/nginx/nginx.conf

/usr/local/bin/v2ray -test -c /usr/local/etc/v2ray/config.json
/usr/local/bin/v2ray -c /usr/local/etc/v2ray/config.json &
