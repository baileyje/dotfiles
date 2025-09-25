#!/usr/bin/env bash

MEMORY_LABEL_COLOR="$YELLOW"

sketchybar --add item memory right \
  --set memory \
  background.drawing=off \
  label.color="$MEMORY_LABEL_COLOR" \
  label.padding_left=3 \
  label.padding_right=6 \
  update_freq=120 \
  icon.color="$MEMORY_LABEL_COLOR" \
  script="$PLUGIN_DIR/stats/scripts/ram.sh" \
  --subscribe memory system_woke power_source_change
