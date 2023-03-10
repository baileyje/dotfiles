#!/usr/bin/env zsh

#.zshrc.d ----------------------------------------------------------------------
pushd $HOME > /dev/null
mkdir -p .config/zsh
for file in .config/zsh/*(.); do
  source "$file"
done
popd > /dev/null

