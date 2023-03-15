#!/usr/bin/env sh

alias dotfiles='git --git-dir=$HOME/dotfiles --work-tree=$HOME'
alias dots='dotfiles'
alias dotsup='dots fo && dots rb origin/master && dots submodule update --init --recursive'
