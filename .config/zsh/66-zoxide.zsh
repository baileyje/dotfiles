#!/usr/bin/env zsh


# zoxide (better `cd`)
# ------------------------------------------------------------------------------
if type zoxide &>/dev/null; then
  eval "$(zoxide init zsh --cmd cd)"
else
  echo ERROR: Could not load zoxide shell integration.
fi


