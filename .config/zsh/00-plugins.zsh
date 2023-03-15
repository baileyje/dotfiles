#!/usr/bin/env zsh

export NVM_LAZY_LOAD=true
export NVM_COMPLETION=true
export NVM_LAZY_LOAD_EXTRA_COMMANDS=('nvim') 

for file in $HOME/.config/zsh/plugins/*; do
  plugin="$file/$(basename $file).plugin.zsh"
  [ -s "$plugin" ] && source "$plugin"
done
