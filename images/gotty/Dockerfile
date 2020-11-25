from golang:buster as builder

run apt-get update && apt-get install -y git && \
    go get -v github.com/yudai/gotty

from debian:buster
copy --from=builder /go/bin/gotty /usr/local/bin/

run apt-get update && DEBIAN_FRONTEND=noninteractive \
    apt-get install -y python3-pip locales locales-all

env LANGUAGE    en_US.UTF-8
env LANG        en_US.UTF-8
env LC_ALL      en_US.UTF-8

entrypoint ["gotty"]
cmd ["-w", "--reconnect", "bash"]