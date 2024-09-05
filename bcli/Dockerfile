FROM node:20-alpine

ENV ENV="/root/.profile"
RUN apk update && apk upgrade &&\
  apk add git && git clone --depth 1 --branch v3.15.0 https://github.com/box/boxcli.git &&\
  cd /boxcli && npm install &&\
  echo 'alias box="/boxcli/bin/run"' >> /root/.profile 

ENTRYPOINT ["/boxcli/bin/run"]
