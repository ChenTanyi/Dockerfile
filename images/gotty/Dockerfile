from golang:1.13-buster as builder

run apt-get update && apt-get install -y git && \
    go get -v github.com/yudai/gotty

from debian:buster
copy --from=builder /go/bin/gotty /usr/local/bin/
entrypoint ["gotty"]
cmd ["-w", "--reconnect", "bash"]