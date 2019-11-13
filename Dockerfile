FROM chifleytech/sqlcd-ui-build:master

FROM node:12.8.1
RUN apt-get update && apt-get install -y xsel
RUN npm install -g serve
RUN npm install http-proxy --save

COPY --from=0 /root/build /root/build
COPY proxy.js /root/proxy.js
COPY proxy.js.template /root/proxy-template.js
COPY run.sh /root/run.sh

WORKDIR /root
RUN npm install http-proxy --save
RUN chmod 755 run.sh

#CMD serve -s build
CMD ["/bin/bash", "run.sh"]
