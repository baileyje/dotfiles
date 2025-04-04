#!/usr/bin/env zsh

fpath=($HOME/.config/zsh/completions/core/src $HOME/.config/zsh/completions/custom $fpath)

autoload -Uz compinit bashcompinit
compinit -u
bashcompinit -u
