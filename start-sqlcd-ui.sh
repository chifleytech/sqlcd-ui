#!/usr/bin/env bash
source ./configure.sh
nohup node proxy-sqlcd.js > sqlcd-proxy.log 2>&1 &
nohup serve -s build-sqlcd  > sqlcd-frontend.log 2>&1 &