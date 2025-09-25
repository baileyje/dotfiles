#!/usr/bin/env bash

source "$PLUGIN_DIR/stats/events/toggle_stats.sh"
source "$PLUGIN_DIR/stats/items/separator-right.sh"
source "$PLUGIN_DIR/stats/items/battery.sh"
source "$PLUGIN_DIR/stats/items/cpu.sh"
source "$PLUGIN_DIR/stats/items/ram.sh"
source "$PLUGIN_DIR/stats/items/disk.sh"
source "$PLUGIN_DIR/stats/items/network.sh"

all_stats=(
  battery
  cpu
  memory
  disk
  network.up
  network.down
  separator_right
)
