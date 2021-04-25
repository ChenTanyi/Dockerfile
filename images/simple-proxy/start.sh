#!/bin/sh
set -e

proxy --hostname 0.0.0.0 --port 8899 &
websockify $PORT :8899