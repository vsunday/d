## Prerequisite 
Create `.cfp` folder under home directory of host machine. Config file is stored at this location.
```
mkdir ~/.cfp
```

##  Alias command
To use shorthand command, execute `alias` comannd below:
```
alias cfp="docker run --rm -it --mount type=bind,source=$HOME/.cfp,target=/root/.cfp cfpcli"
```

## Configuration
Execute `cfp config` to setup CFP account. Config file is stored at `~/.cfp/.cfp-config`  under host machine.

```
cfp config
```