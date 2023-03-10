#!/usr/bin/env zsh

#!/usr/bin/env bash

alias compose='docker-compose'
alias compdev='compose --file compose-dev.yaml'
alias comprod='compose --file compose-prod.yaml'

alias dockswab='docker rmi --force $(docker images --filter dangling=true -q)'
alias dockprune='docker system prune --all --force --volumes'


#JB's scripts
alias dock='docker-compose'
function dock-dev {
    if test -f "docker-compose.development.yaml"; then
        dock -f docker-compose.yaml -f docker-compose.development.yaml $@
    else
        dock -f docker-compose.yaml $@
    fi
}
alias ddd='dock-dev down'
alias ddu="dock-dev up --no-color 2>&1 | sed 's/^[^ ]*  *| //'"
alias ddrs='ddd && ddu'
alias ddb='dock-dev build'
alias ddr='ddd && yarn install --force && yarn clean && ddb'
alias ddru='ddr && ddu'
