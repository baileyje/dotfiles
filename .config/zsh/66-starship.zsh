#!/usr/bin/env zsh


# Starship
# ------------------------------------------------------------------------------
if type starship &>/dev/null; then
  eval "$(starship init zsh)"
  export STARSHIP_CONFIG="$HOME/.config/starship/starship.toml"
else
  echo ERROR: Could not load starship.
fi
