#!/usr/bin/env bash

CPU_LABEL_COLOR="$PEACH"

sketchybar --add item cpu right \
  --set cpu \
  background.drawing=off \
  label.color="$CPU_LABEL_COLOR" \
  label.padding_left=3 \
  label.padding_right=6 \
  icon.color="$CPU_LABEL_COLOR" \
  icon= \
  update_freq=2 \
  script="$PLUGIN_DIR/stats/scripts/cpu.sh"
