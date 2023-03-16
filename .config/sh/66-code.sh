#!/usr/bin/env sh

code='code'
if which codium > /dev/null; then code='codium'; fi
dir="$HOME/.config/vscodium"
alias code="$code --user-data-dir $dir --extensions-dir $dir/extensions"

alias code.extensions.install='for ext in $(jq -r ".[] | .identifier.id" .config/vscodium/extensions/extensions.json); do code --install-extension $ext; done'
alias code.ext.inst='code.extensions.install'
alias code.extensions.update='for ext in $(jq -r ".[] | .identifier.id" .config/vscodium/extensions/extensions.json); do code --install-extension $ext --force; done'
alias code.ext.up='code.extensions.update'
