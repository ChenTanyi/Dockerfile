from python:alpine
env PORT 80
run apk add --no-cache --virtual .build-deps g++ && \
    pip install --no-cache-dir proxy.py websockify && \
    apk del .build-deps
copy start.sh /start.sh

cmd ["sh", "-c", "chmod +x /start.sh && /start.sh"]