from nginx:stable-alpine
arg TARGETOS
arg TARGETARCH
arg TARGETVARIANT
env TARGETOS=$TARGETOS
env TARGETARCH=$TARGETARCH
env TARGETVARIANT=$TARGETVARIANT
env PORT=80
copy server.json /usr/local/etc/v2ray/config.json.template
copy nginx.conf /etc/nginx/nginx.conf.template
copy setup-v2ray.sh /docker-entrypoint.d/setup-v2ray.sh
