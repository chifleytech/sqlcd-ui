#!/usr/bin/env bash
source ./configure.sh
nohup node proxy-sqlcd.js > sqlcd-proxy.log 2>&1 &
serve -s build-sqlcd