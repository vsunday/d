FROM clojure:lein

RUN apt-get -y update && apt-get -y upgrade &&\
  apt-get install -y emacs git tmux &&\
  echo 'alias ls="ls --color=auto"' >> /root/.bashrc&&\
  echo 'export LC_ALL=C.UTF-8' >> /root/.bashrc&&\
  echo 'set number shiftwidth=2 tabstop=2 expandtab' >> /root/.vimrc &&\
  wget -P /root https://github.com/flyingmachine/emacs-for-clojure/tarball/master &&\
  mkdir /root/.emacs.d &&\
  tar -xzf /root/master -C /root/.emacs.d --strip-components 1

ENTRYPOINT ["/bin/bash"]
