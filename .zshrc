#!/usr/bin/env zsh

# General Options
# ------------------------------------------------------------------------------
## List jobs in the long format by default.
setopt LONG_LIST_JOBS

## Disable flow control and hence restore the ability to use C-s and C-q
setopt NO_FLOW_CONTROL

# Set Up Line Editor
# ------------------------------------------------------------------------------
## Enable vi mode
bindkey -v

## Lower mode switching delay to 10ms
KEYTIMEOUT=1

## Bind C-R to search backwards in all modes
bindkey '^R' history-incremental-search-backward

## Bind C-S to search forward in all modes
bindkey '^S' history-incremental-search-forward


# Set Up Command History
# ------------------------------------------------------------------------------
## Enable globally shared history (same history in every shell)
# setopt SHARE_HISTORY

## When writing out the history file, older duplicate commands are omitted
setopt HIST_SAVE_NO_DUPS

## Don't save commands prefixed with at least one space to history
setopt HIST_IGNORE_SPACE

## Don't directly execute commands when using history expansion
setopt HIST_VERIFY

## Max number of history lines in memory
HISTSIZE=25000

## Max number of history lines saved in history file
SAVEHIST=200000

# ZSH and SH User Scripts
source_sh () {
  emulate -LR sh
  . "$@"
}

source_zsh () {
  . "$@"
}


pushd $HOME > /dev/null
mkdir -p .config/sh .config/zsh
for file in $(/bin/ls -1 .config/{z,}sh/*.* | sort -t / -k 2 | sort -n -t / -k 3); do
  parts=(${(s[/])file})
  eval "source_$parts[2] $file" 
done
popd > /dev/null


