from nginx:stable-alpine
arg TARGETOS
arg TARGETARCH
arg TARGETVARIANT
env TARGETOS=$TARGETOS
env TARGETARCH=$TARGETARCH
env TARGETVARIANT=$TARGETVARIANT
env PORT=80
env SERVER=http://httpbin.org:80
copy default.conf /etc/nginx/templates/default.conf.template
