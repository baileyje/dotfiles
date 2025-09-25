#!/usr/bin/env bash

CLOCK_LABEL_COLOR="$RED"

sketchybar --add item clock right \
  --set clock \
  label.color="$CLOCK_LABEL_COLOR" \
  icon.padding_left=10 \
  label.padding_left=3 \
  label.padding_right=10 \
  icon.color="$CLOCK_LABEL_COLOR" \
  icon= \
  update_freq=10 \
  script="$PLUGIN_DIR/clock/scripts/clock.sh"
