from golang as builder
env CGO_ENABLED=0
run mkdir -p /go/src/github.com/v2fly && \
    cd /go/src/github.com/v2fly && \
    git clone --depth 1 -b master https://github.com/v2fly/v2ray-core
workdir /go/src/github.com/v2fly/v2ray-core
run go mod download
run mkdir -p build_assets && \
    go build -v -o build_assets/v2ray -trimpath -ldflags "-s -w -buildid=" ./main && \
    go build -v -o build_assets/v2ctl -trimpath -ldflags "-s -w -buildid=" -tags confonly ./infra/control/main

from nginx:stable-alpine

copy --from=builder /go/src/github.com/v2fly/v2ray-core/build_assets/v2ray /usr/local/bin/
copy --from=builder /go/src/github.com/v2fly/v2ray-core/build_assets/v2ctl /usr/local/bin/

copy server.json /usr/local/etc/v2ray/config.json.template
copy nginx.conf /etc/nginx/nginx.conf.template
copy setup-v2ray.sh /docker-entrypoint.d/setup-v2ray.sh
