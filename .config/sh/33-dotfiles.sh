#!/usr/bin/env sh

alias dotfiles='git --git-dir=$HOME/dotfiles --work-tree=$HOME'
alias dots='dotfiles'
alias dotsup='dots pull origin master:master && dots submodule update --init --recursive'
