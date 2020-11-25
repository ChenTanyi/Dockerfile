from golang:buster as builder

run apt-get update && apt-get install -y git && \
    go get -v github.com/fatedier/frp/cmd/frps

from alpine:latest
copy --from=builder /go/bin/frps /usr/local/bin/
add entrypoint.sh /entrypoint.sh

entrypoint ["/entrypoint.sh"]
cmd ["frps", "-c", "/frps.ini"]