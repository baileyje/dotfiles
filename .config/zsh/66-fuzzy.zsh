#!/usr/bin/env zsh

# Setup fzf
# ---------
for dir in "/usr/local/opt/fzf/shell /usr/share/fzf"
do
  if [[ -d "$dir" ]]; then
    # Auto-completion
    [[ $- == *i* ]] && source "$dir/completion.zsh" 2> /dev/null
    # Key bindings
    source "$dir/key-bindings.zsh"
  fi
done
