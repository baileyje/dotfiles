#!/usr/bin/env bash

BATTERY_LABEL_COLOR="$GREEN"

sketchybar --add item battery right \
  --set battery \
  label.font="$LABEL_BASE_FONT:Bold:14" \
  background.drawing=off \
  label.color="$BATTERY_LABEL_COLOR" \
  label.padding_left=3 \
  label.padding_right=6 \
  icon.color="$BATTERY_LABEL_COLOR" \
  update_freq=120 \
  script="$PLUGIN_DIR/stats/scripts/battery.sh" \
  --subscribe battery system_woke power_source_change
