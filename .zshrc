#!/usr/bin/env zsh

#.zshrc.d ----------------------------------------------------------------------
source_sh () {
  emulate -LR sh
  . "$@"
}

source_zsh () {
  . "$@"
}

pushd $HOME > /dev/null
mkdir -p .config/sh .config/zsh
for file in $(ls -1 .config/{z,}sh/*.* | sort -t / -k 2 | sort -n -t / -k 3); do
  echo $file
  parts=(${(s[/])file})
  eval "source_$parts[2] $file" 
done
popd > /dev/null

