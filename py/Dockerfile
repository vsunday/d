FROM python:3.14-slim

# basic setup
RUN apt-get update -y &&\
 apt-get install -y --no-install-recommends git tmux vim curl nodejs npm &&\
  apt-get clean && \
  rm -rf /var/lib/apt/lists/* &&\
  echo 'set number tabstop=4 shiftwidth=4 expandtab' >> /root/.vimrc &&\
  echo 'alias ls="ls --color=auto"' >> /root/.bashrc &&\
  echo 'export LC_ALL="C.UTF-8"' >> /root/.bashrc
COPY --from=docker:cli /usr/local/bin/docker /usr/local/bin/docker
RUN curl -fsSL https://claude.ai/install.sh | bash &&\
  echo 'export PATH="$HOME/.local/bin:$PATH"' >> /root/.bashrc

ENTRYPOINT ["/bin/bash"]
