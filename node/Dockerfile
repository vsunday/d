FROM node:22-bullseye

# basic setup
RUN apt-get update -y && apt-get upgrade -y &&\
  apt-get install -y git tmux vim zip &&\
  echo 'set number tabstop=2 shiftwidth=2 expandtab' >> /root/.vimrc &&\
  echo 'alias ls="ls --color=auto"' >> /root/.bashrc &&\
  echo 'export LC_ALL="C.UTF-8"' >> /root/.bashrc &&\
  npm i -g pnpm &&\
  # see https://github.com/pnpm/pnpm/issues/5803
  pnpm config set store-dir /home/node/.local/share/pnpm/store &&\
  SHELL=bash pnpm setup && . /root/.bashrc && pnpm i -g vercel

ENTRYPOINT ["/bin/bash"]
