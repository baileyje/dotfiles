#!/usr/bin/env zsh


# eza (better `ls`)
# ------------------------------------------------------------------------------
if type eza &>/dev/null; then
  alias l="eza --icons=always"
  alias ls="eza --icons=always"
  alias ll="eza -lg --icons=always"
  alias la="eza -lag --icons=always"
  alias lt="eza -lTg --icons=always"
  alias lt2="eza -lTg --level=2 --icons=always"
  alias lt3="eza -lTg --level=3 --icons=always"
  alias lta="eza -lTag --icons=always"
  alias lta2="eza -lTag --level=2 --icons=always"
  alias lta3="eza -lTag --level=3 --icons=always"
else
  echo ERROR: eza could not be found. Skip setting up eza aliases.
fi

