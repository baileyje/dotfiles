#!/usr/bin/env bash

separator_right=(
  icon=
  icon.font="$ICON_BASE_FONT:Bold:16.0"
  background.padding_left=6
  background.padding_right=6
  label.drawing=off
  click_script='sketchybar --trigger toggle_stats'
  icon.color="$TEXT"
)
sketchybar --add item separator_right right \
  --set separator_right "${separator_right[@]}"
