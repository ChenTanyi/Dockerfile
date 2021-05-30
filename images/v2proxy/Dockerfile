from alpine
arg TARGETOS
arg TARGETARCH
arg TARGETVARIANT
env TARGETOS=$TARGETOS
env TARGETARCH=$TARGETARCH
env TARGETVARIANT=$TARGETVARIANT
env PORT=80
copy server.json /usr/local/etc/v2ray/config.json
copy start-v2ray.sh /start-v2ray.sh

cmd ["sh", "-c", "chmod +x /start-v2ray.sh && /start-v2ray.sh"]