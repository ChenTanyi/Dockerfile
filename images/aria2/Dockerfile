arg FILESERVER_VERSION=latest
from chentanyi/fileserver:${FILESERVER_VERSION} as builder

from alpine:latest

env ARIANG_VERSION 1.1.7
run apk update && \
    apk add --no-cache --virtual .build-deps git && \
    mkdir -p /aria2/ariang /aria2/session /aria2/conf /aria2/webui /tmp && \
    cd /aria2/ariang && \
    wget https://github.com/mayswind/AriaNg/releases/download/${ARIANG_VERSION}/AriaNg-${ARIANG_VERSION}.zip && \
    unzip AriaNg-${ARIANG_VERSION}.zip && \
    rm -rf AriaNg-${ARIANG_VERSION}.zip && \
    cd /tmp && \
    git clone https://github.com/ziahamza/webui-aria2 && \
    mv webui-aria2/docs/* /aria2/webui/ && \
    rm -rf webui-aria2 && \
    apk del .build-deps && \
    apk add --no-cache --update aria2


add aria2.conf /aria2-tmp/aria2.conf
add entrypoint.sh /entrypoint.sh

copy --from=builder /usr/bin/fileserver /usr/bin/
workdir /
volume ["/aria2/conf", "/aria2/downloads", "/aria2/session"]
expose 6800 80 51413

entrypoint ["/entrypoint.sh"]