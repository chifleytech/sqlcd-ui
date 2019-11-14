#!/usr/bin/env bash
echo "BACKEND: "$PROXY_BACKEND
echo "FRONTEND: "$PROXY_FRONTEND
sed 's/${PROXY_BACKEND}/'"${PROXY_BACKEND}"'/g' proxy-sqlcd.js.template | sed 's/${PROXY_FRONTEND}/'"${PROXY_FRONTEND}"'/g' | sed 's/${PROXY_LISTEN_PORT}/'"${PROXY_LISTEN_PORT}"'/g' > proxy-sqlcd.js
if [[ -z "$REACT_APP_DEMO" ]]; then
 echo "NO DEMO TEMPLATE"
 cat index.html.template > build-sqlcd/index.html
else
 echo "DEMO TEMPLATE: "$REACT_APP_DEMO
 sed 's/<head>/<head><script>window.REACT_APP_DEMO = '"$REACT_APP_DEMO"';<\/script>/g' index.html.template > build-sqlcd/index.html
fi
