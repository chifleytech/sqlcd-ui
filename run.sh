#!/usr/bin/env bash
echo "BACKEND: "$BACKEND
echo "FRONTEND: "$FRONTEND
sed -i 's/_server_/'"$BACKEND"'/g' proxy.js
sed -i 's/_client_/'"$FRONTEND"'/g' proxy.js
sed -i 's/_port_/'"$PORT"'/g' proxy.js
nohup node proxy.js proxy.log > output.log &
serve -s build