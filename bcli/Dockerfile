FROM node:20-alpine

ENV ENV="/root/.profile"
 RUN apk add git && git clone https://github.com/box/boxcli.git &&\
  cd /boxcli && npm install &&\
  echo 'alias box="/boxcli/bin/run"' >> /root/.profile

# RUN apk update && apk add git && npm install -g @box/cli &&\
#  echo 'alias box="/boxcli/bin/run"' >> /root/.profile

ENTRYPOINT ["/boxcli/bin/run"]
# ENTRYPOINT ["/bin/sh"]
