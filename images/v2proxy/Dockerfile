from nginx:stable-alpine

run mkdir -p /tmp/v2ray /var/log/v2ray && \
    wget -O /tmp/v2ray/v2ray.zip https://github.com/v2fly/v2ray-core/releases/latest/download/v2ray-linux-64.zip && \
    unzip /tmp/v2ray/v2ray.zip -d /tmp/v2ray && \
    install -m 755 /tmp/v2ray/v2ray /usr/local/bin/v2ray && \
    install -m 755 /tmp/v2ray/v2ctl /usr/local/bin/v2ctl && \
    rm -rf /tmp/v2ray

copy server.json /usr/local/etc/v2ray/config.json.template
copy nginx.conf /etc/nginx/nginx.conf.template
copy setup-v2ray.sh /docker-entrypoint.d/setup-v2ray.sh
