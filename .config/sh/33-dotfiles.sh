#!/usr/bin/env sh

alias dotfiles='git --git-dir=$HOME/dotfiles --work-tree=$HOME'
alias dots='dotfiles'
alias dotsup='dots fetch origin master:master && dots submodule update --init --recursive'
