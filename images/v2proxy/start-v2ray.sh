#!/bin/sh
set -e

mkdir -p /tmp/v2ray
cd /tmp/v2ray
wget https://github.com/chentanyi/v2release/releases/latest/download/v2ray-${TARGETOS}-${TARGETARCH}${TARGETVARIANT}.tar.xz
tar xJf v2ray-${TARGETOS}-${TARGETARCH}${TARGETVARIANT}.tar.xz -C /usr/local/bin
cd /
rm -rf /tmp/v2ray

set -a
PROTOCOL=${PROTOCOL:-vless}
REQ_PATH="${REQ_PATH%/}/"
REQ_PATH="${REQ_PATH#/}"
PORTAL_PATH=${PORTAL_PATH:-portal}
PORTAL_PATH="${PORTAL_PATH%/}/"
PORTAL_PATH="${PORTAL_PATH#/}"
set +a

# alpine doesn't contain envsubst
ALL_ENV='$REQ_PATH $PORTAL_PATH $UUID $PROTOCOL'
for ENV_KEY in $ALL_ENV; do
    VALUE=$(eval echo \"$ENV_KEY\")
    sed -i "s|$ENV_KEY|$VALUE|g" /usr/local/etc/v2ray/config.json
done

mkdir -p /var/log/v2ray/
/usr/local/bin/v2ray -test -c /usr/local/etc/v2ray/config.json
/usr/local/bin/v2ray -c /usr/local/etc/v2ray/config.json
