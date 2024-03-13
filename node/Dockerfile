FROM node:20-buster

# basic setup
RUN apt-get update -y && apt-get upgrade -y &&\
  apt-get install -y git tmux vim zip &&\
  echo 'set number tabstop=4 shiftwidth=4 expandtab' >> /root/.vimrc &&\
  echo 'alias ls="ls --color=auto"' >> /root/.bashrc &&\
  echo 'export LC_ALL="C.UTF-8"' >> /root/.bashrc &&\
  npm i -g pnpm

# AWS SAM install
RUN wget -O /tmp/sam.zip https://github.com/aws/aws-sam-cli/releases/latest/download/aws-sam-cli-linux-x86_64.zip &&\
  unzip /tmp/sam.zip -d /tmp/sam-installation &&\
  /tmp/sam-installation/install

ENTRYPOINT ["/bin/bash"]
