#!/usr/bin/env bash

IP_ADDR_LABEL_COLOR="$TEAL"
IP_ADDR_BACKGROUND_BORDER_COLOR="$TEAL"

network_def=(
  icon.padding_left=10
  label.padding_left=3
  label.padding_right=10
  label.color="$IP_ADDR_LABEL_COLOR"
  icon.highlight_color="$TEXT"
  icon.color="$IP_ADDR_LABEL_COLOR"
  # background.corner_radius="$BRACKET_BACKGROUND_CORNER_RADIUS"
  # background.border_width="$BRACKET_BACKGROUND_BORDER_WIDTH"
  # background.color="$SURFACE0"
  # background.border_color="$SURFACE1"
)

sketchybar --add item network right \
  --set network script="$PLUGIN_DIR/network/scripts/network.sh" \
  update_freq=30 \
  "${network_def[@]}" \
  update_freq=120 \
  --subscribe network wifi_change
