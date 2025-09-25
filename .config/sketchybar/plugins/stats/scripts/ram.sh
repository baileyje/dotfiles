#!/usr/bin/env bash

PERCENTAGE=$(memory_pressure | grep "System-wide memory free percentage:" | awk '{ printf("%02.0f\n", 100-$5"%") }')

if [ $PERCENTAGE = "" ]; then
  exit 0
fi

ICON=󰘚

sketchybar -m --set "$NAME" icon=${ICON} label="${PERCENTAGE}%"
