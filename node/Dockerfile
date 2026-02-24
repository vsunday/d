FROM node:24-slim

# basic setup
RUN apt-get update -y &&\
  apt-get install -y --no-install-recommends git tmux vim curl ssh &&\
  rm -rf /var/lib/apt/lists/* &&\
  echo 'set number tabstop=2 shiftwidth=2 expandtab' >> /root/.vimrc &&\
  echo 'alias ls="ls --color=auto"' >> /root/.bashrc &&\
  echo 'export LC_ALL="C.UTF-8"' >> /root/.bashrc &&\
  npm i -g pnpm &&\
  # see https://github.com/pnpm/pnpm/issues/5803
  pnpm config set store-dir /home/node/.local/share/pnpm/store &&\
  SHELL=bash pnpm setup && . /root/.bashrc && pnpm i -g vercel
COPY --from=docker:cli /usr/local/bin/docker /usr/local/bin/docker
RUN curl -fsSL https://claude.ai/install.sh | bash &&\
  echo 'export PATH="$HOME/.local/bin:$PATH"' >> /root/.bashrc

ENTRYPOINT ["/bin/bash"]
