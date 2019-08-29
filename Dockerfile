FROM chifleytech/sqlcd-ui-build:latest

FROM node:12.8.1
RUN apt-get update && apt-get install -y xsel
RUN npm install -g serve
COPY --from=0 /root/build /root/build
WORKDIR /root
EXPOSE 5000
CMD serve -s build
