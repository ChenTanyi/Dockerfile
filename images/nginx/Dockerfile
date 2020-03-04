arg IMAGE_VERSION=stable-alpine
from nginx:$IMAGE_VERSION as builder

run apk update && \
    apk add --no-cache --virtual .build-deps \
        gcc \
        libc-dev \
        make \
        openssl-dev \
        pcre-dev \
        zlib-dev \
        linux-headers \
        curl \
        gnupg \
        libxslt-dev \
        gd-dev \
        geoip-dev \
        wget \
        git && \
    curl -OL "http://nginx.org/download/nginx-${NGINX_VERSION}.tar.gz" && \
    tar xzf nginx-${NGINX_VERSION}.tar.gz && \
    NGINX_CONF_ARGS=$(nginx -V 2>&1 | sed -n -e 's/^.*arguments: //p') && \
    git clone https://github.com/fdintino/nginx-upload-module && \
    cd nginx-${NGINX_VERSION} && \
    ./configure --with-compat $CONFARGS --add-dynamic-module=../nginx-upload-module && \
    make modules && \
    cp ./objs/ngx_http_upload_module.so /tmp/

from nginx:$IMAGE_VERSION
copy --from=builder /tmp/ngx_http_upload_module.so /usr/local/nginx/modules/