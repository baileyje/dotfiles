#!/usr/bin/env bash

#!/usr/bin/env bash

#
#
# Catppuccin Macchiato palette
#
#

BASE=0xff24273a
MANTLE=0xff1e2030
CRUST=0xff181926

TEXT=0xffcad3f5
SUBTEXT0=0xffb8c0e0
SUBTEXT1=0xffa5adcb

SURFACE0=0xff363a4f
SURFACE1=0xff494d64
SURFACE2=0xff5b6078

OVERLAY0=0xff6e738d
OVERLAY1=0xff8087a2
OVERLAY2=0xff939ab7

BLUE=0xff8aadf4
LAVENDER=0xffb7bdf8
SAPPHIRE=0xff7dc4e4
SKY=0xff91d7e3
TEAL=0xff8bd5ca
GREEN=0xffa6da95
YELLOW=0xffeed49f
PEACH=0xfff5a97f
MAROON=0xffee99a0
RED=0xffed8796
MAUVE=0xffc6a0f6
PINK=0xfff5bde6
FLAMINGO=0xfff0c6c6
ROSEWATER=0xfff4dbd6

export RANDOM_CAT_COLOR=("$BLUE" "$LAVENDER" "$SAPPHIRE" "$SKY" "$TEAL" "$GREEN" "$YELLOW" "$PEACH" "$MAROON" "$RED" "$MAUVE" "$PINK" "$FLAMINGO" "$ROSEWATER")

function getRandomCatColor() {
  echo "${RANDOM_CAT_COLOR[$RANDOM % ${#RANDOM_CAT_COLOR[@]}]}"
}

#
# LEGACY COLORS
#
# Color Palette
export GREY=0xff939ab7
export TRANSPARENT=0x00000000

# General bar colors
# export BAR_COLOR=$BASE
# export ICON_COLOR=$TEXT  # Color of all icons
# export LABEL_COLOR=$TEXT # Color of all labels
