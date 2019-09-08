#!/usr/bin/env bash
echo "BACKEND: "$PROXY_BACKEND
echo "FRONTEND: "$PROXY_FRONTEND
sed -i 's/_server_/'"$PROXY_BACKEND"'/g' proxy.js
sed -i 's/_client_/'"$PROXY_FRONTEND"'/g' proxy.js
sed -i 's/_port_/'"$PROXY_LISTEN_PORT"'/g' proxy.js
nohup node proxy.js proxy.log > output.log &
serve -s build