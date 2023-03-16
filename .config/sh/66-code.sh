#!/usr/bin/env sh

code='code'
if which codium > /dev/null; then code='codium'; fi
dir="$HOME/.config/vscodium"
alias code="$code --user-data-dir $dir --extensions-dir $dir/extensions"
