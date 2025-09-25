#!/usr/bin/env bash

network_down=(
  y_offset=-5
  label.font="$LABEL_BASE_FONT:Heavy:9"
  label.color="$TEXT"
  icon="⇣"
  icon.font="$ICON_BASE_FONT:Bold:12.0"
  icon.color="$GREEN"
  icon.highlight_color="$BLUE"
  update_freq=1
)

network_up=(
  background.padding_right=-58
  y_offset=6
  label.font="$LABEL_BASE_FONT:Heavy:9"
  label.color="$TEXT"
  icon="⇡"
  icon.font="$ICON_BASE_FONT:Bold:12.0"
  icon.color="$GREEN"
  icon.highlight_color="$BLUE"
  update_freq=1
  script="$PLUGIN_DIR/stats/scripts/network.sh"
)

sketchybar --add item network.down right \
  --set network.down "${network_down[@]}" \
  --add item network.up right \
  --set network.up "${network_up[@]}"
