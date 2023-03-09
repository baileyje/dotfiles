#!/usr/bin/env zsh

#.zshrc.d ----------------------------------------------------------------------
pushd $HOME > /dev/null
mkdir -p .zshrc.d
for file in .zshrc.d/*(.); do
  source "$file"
done
popd > /dev/null
