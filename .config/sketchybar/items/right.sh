#!/usr/bin/env bash

source "$PLUGIN_DIR/clock/item.sh"

sketchybar --add item clock_separator right \
  --set clock_separator \
  background.drawing=off \
  label.padding_left=-6 \
  label.y_offset=0 \
  label="|"

source "$PLUGIN_DIR/network/item.sh"
source "$PLUGIN_DIR/stats/item.sh"

right_bracket=(
  background.corner_radius="$BRACKET_BACKGROUND_CORNER_RADIUS"
  background.border_width="$BRACKET_BACKGROUND_BORDER_WIDTH"
  background.color="$SURFACE0"
  background.border_color="$SURFACE1"
)

sketchybar --add bracket right_bracket clock network "${all_stats[@]}" \
  --set right_bracket "${right_bracket[@]}"
