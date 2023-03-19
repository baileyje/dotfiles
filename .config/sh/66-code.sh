#!/usr/bin/env sh

code='code'
if which codium > /dev/null; then code='codium'; fi
dir="$HOME/.config/vscodium"
alias code="$code --user-data-dir $dir --extensions-dir $dir/extensions"
vscodium_plugins() {
  file=$dir/extensions/extensions.json
  exts=($(jq -r ".[] | .identifier.id" $file  | tr "\n" " "))
  rm $file
  for ext in $exts; do 
    code $* $ext
  done
}
alias code.extensions.install='vscodium_plugins --install-extension'
alias code.ext.inst='code.extensions.install'
alias code.extensions.update='vscodium_plugins --force --install-extension'
alias code.ext.up='code.extensions.update'
