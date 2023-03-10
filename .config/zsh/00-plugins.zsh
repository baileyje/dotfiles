#!/usr/bin/env zsh

for file in $HOME/.config/zsh/plugins/*; do
  plugin="$file/$(basename $file).plugin.zsh"
  [ -s "$plugin" ] && source "$plugin"
done
