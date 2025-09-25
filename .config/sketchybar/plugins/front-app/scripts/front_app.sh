#!/usr/bin/env bash

source "$CONFIG_DIR/environment"

if [ "$SENDER" = "front_app_switched" ] && [ ! -z "$INFO" ]; then
  sketchybar --set "$NAME" \
    label="$INFO" \
    icon="$($PLUGIN_DIR/front-app/scripts/icon_map.sh "$INFO")"
fi
