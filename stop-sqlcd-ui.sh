#!/usr/bin/env bash
echo "Shutting-down..."
kill -15 $(ps aux | grep '[s]erve -s build-sqlcd' | awk '{print $2}')
kill -15 $(ps aux | grep '[n]ode proxy-sqlcd.js' | awk '{print $2}')
