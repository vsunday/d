FROM node:latest

# basic setup
RUN apt-get update -y && apt-get upgrade -y &&\
  apt-get install -y git tmux vim &&\
  echo 'set number tabstop=4 shiftwidth=4 expandtab' >> /root/.vimrc &&\
  echo 'alias ls="ls --color=auto"' >> /root/.bashrc &&\
  echo 'export LC_ALL="C.UTF-8"' >> /root/.bashrc

# install heroku cli
RUN  curl https://cli-assets.heroku.com/install.sh | sh

ENTRYPOINT ["/bin/bash"]
