## Alias command
To use shorthand command, execute `alias` command below.
```
alias box='docker run --rm -it --mount type=bind,source=$HOME/Downloads,target=/data --mount type=bind,source=$HOME/.box,target=/root/.box  bcli'
```

## OAuth2 login
Please use `box login` command with `-c` option.
```
box login -c
```