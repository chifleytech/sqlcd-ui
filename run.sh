#!/usr/bin/env bash
sed -i 's/_server_/'"$BACKEND"'/g' proxy.js
sed -i 's/_client_/'"$FRONTEND"'/g' proxy.js
npm install http-proxy --save
nohup node proxy.js proxy.log > output.log &
serve -s build