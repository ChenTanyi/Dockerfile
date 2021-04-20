#!/bin/sh
set -e

mkdir /v2ray
wget https://github.com/v2fly/v2ray-core/releases/latest/download/v2ray-linux-64.zip -P /v2ray
unzip /v2ray/v2ray-linux-64.zip -d /v2ray
chmod +x /v2ray/v2ray && mv /v2ray/v2ray /usr/bin
chmod +x /v2ray/v2ctl && mv /v2ray/v2ctl /usr/bin
rm -rf /v2ray

cat << EOF > /config.json
{
  "inbounds": [
    {
      "port": 80,
      "listen": "0.0.0.0",
      "protocol": "vless",
      "settings": {
        "clients": [
          {
            "id": "$UUID",
            "level": 0
          }
        ],
        "decryption": "none"
      },
      "streamSettings": {
        "network": "ws"
      }
    }
  ],
  "outbounds": [
    {
      "protocol": "freedom"
    }
  ]
}
EOF

v2ray -c /config.json