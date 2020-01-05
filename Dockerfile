FROM chifleytech/sqlcd-ui-build:1.2.0

FROM node:12.8.1
RUN apt-get update && apt-get install -y xsel
RUN npm install -g serve
RUN npm install http-proxy --save

COPY --from=0 /root/build /root/build-sqlcd
COPY proxy-sqlcd.js.template /root/proxy-sqlcd.js.template
COPY run.sh /root/run.sh
COPY configure.sh /root/configure.sh

COPY start-sqlcd-ui.sh /root/start-sqlcd-ui.sh
COPY stop-sqlcd-ui.sh /root/stop-sqlcd-ui.sh

WORKDIR /root
RUN npm install http-proxy --save
RUN chmod 755 run.sh start-sqlcd-ui.sh stop-sqlcd-ui.sh configure.sh
RUN cp /root/build-sqlcd/index.html /root/index.html.template

CMD ["/bin/bash", "run.sh"]
