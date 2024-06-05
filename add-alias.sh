#! /bin/zsh
# docker commands
echo "alias dcu='docker compose up -d'" >> ~/.zshrc
echo "alias dcd='docker compose down'" >> ~/.zshrc
e&cho "alias deb='docker exec -it "'$(docker ps -lq)'" /bin/bash'" >> ~/.zshrc

# cli commands
echo "alias box='docker run --rm -it --mount type=bind,source=$HOME/Downloads,target=/data --mount type=bind,source=$HOME/.box,target=/root/.box  bcli'"
echo "cfp='docker run --rm -it --mount type=bind,source=$HOME/.cfp,target=/root/.cfp cfpcli'"
