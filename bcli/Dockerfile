FROM node:lts-alpine

ENV ENV="/root/.profile"
RUN apk add git && git clone https://github.com/box/boxcli.git &&\
  cd /boxcli && npm install &&\
  echo 'alias box="/boxcli/bin/run"' >> /root/.profile

# ENTRYPOINT ["/boxcli/bin/run"]
ENTRYPOINT ["/bin/sh"]
