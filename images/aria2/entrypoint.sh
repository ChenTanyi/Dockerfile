#!/bin/sh
if [[ ! -f /aria2/conf/aria2.conf ]]; then
    cp /aria2-tmp/aria2.conf /aria2/conf/aria2.conf
fi

touch /aria2/session/aria2.session

aria2c --conf-path=/aria2/conf/aria2.conf --rpc-secret="$RPC_SECRET"
fileserver $@