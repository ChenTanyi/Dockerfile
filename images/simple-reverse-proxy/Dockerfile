from nginx:stable-alpine
arg TARGETOS
arg TARGETARCH
arg TARGETVARIANT
env TARGETOS=$TARGETOS
env TARGETARCH=$TARGETARCH
env TARGETVARIANT=$TARGETVARIANT
env PORT=80
env SERVER=httpbin.org:80
env NGINX_ENVSUBST_OUTPUT_DIR=/etc/nginx
copy nginx.conf /etc/nginx/templates/nginx.conf.template
