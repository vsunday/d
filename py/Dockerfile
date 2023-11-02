FROM python:3.9

# basic setup
RUN apt-get update -y && apt-get upgrade -y
RUN apt-get install -y git tmux vim zip &&\
  # apt-get install -y python3-dev &&\
  echo 'set number tabstop=4 shiftwidth=4 expandtab' >> /root/.vimrc &&\
  echo 'alias ls="ls --color=auto"' >> /root/.bashrc &&\
  echo 'export LC_ALL="C.UTF-8"' >> /root/.bashrca

RUN wget -O /tmp/aws-sam-cli-linux-x86_64.zip https://github.com/aws/aws-sam-cli/releases/latest/download/aws-sam-cli-linux-x86_64.zip &&\
  unzip /tmp/aws-sam-cli-linux-x86_64.zip -d /tmp/sam-installation &&\
  /tmp/sam-installation/install

ENTRYPOINT ["/bin/bash"]
