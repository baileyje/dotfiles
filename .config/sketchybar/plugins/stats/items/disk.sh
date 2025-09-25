#!/usr/bin/env bash

DISK_LABEL_COLOR="$BLUE"

sketchybar --add item disk right \
  --set disk \
  background.drawing=off \
  label.color="$DISK_LABEL_COLOR" \
  label.padding_left=3 \
  label.padding_right=6 \
  icon.color="$DISK_LABEL_COLOR" \
  icon.padding_left=4 \
  icon=󰋊 update_freq=2 \
  script="$PLUGIN_DIR/stats/scripts/disk.sh"
