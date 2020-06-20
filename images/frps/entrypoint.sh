#!/bin/sh
if [[ ! -f /frps.ini ]]; then
    touch /frps.ini
fi

$@