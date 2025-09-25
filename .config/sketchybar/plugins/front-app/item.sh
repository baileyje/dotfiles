#!/usr/bin/env bash

FRONT_APP_LABEL_COLOR="$TEXT"

sketchybar --add item front_app left \
  --subscribe front_app front_app_switched \
  --set front_app \
  background.drawing=off \
  label.color="$FRONT_APP_LABEL_COLOR" \
  label.padding_left=6 \
  label.padding_right=0 \
  icon.font="sketchybar-app-font:Regular:16.0" \
  icon.color="$FRONT_APP_LABEL_COLOR" \
  icon=":default:" \
  script="$PLUGIN_DIR/front-app/scripts/front_app.sh"
