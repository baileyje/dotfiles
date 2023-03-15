#!/usr/bin/env zsh

# -- shell startup profiling ---------------------------------------------------
# uncomment the following and run 'zprof' in terminal to profilej slow startup
# zmodload zsh/zprof

# --.config/zsh ----------------------------------------------------------------
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
  parts=(${(s[/])file})
  eval "source_$parts[2] $file" 
done
popd > /dev/null

