#!/usr/bin/env bash

# SPACE_ICONS=("1" "2" "3" "4" "5" "6" "7" "8" "9" "10")
#
# sketchybar --add item spacer.1 left \
#     --set spacer.1 background.drawing=off \
#     label.drawing=off \
#     icon.drawing=off \
#     width=10
#
# for i in {0..9}; do
#     sid=$((i + 1))
#     sketchybar --add space space.$sid left \
#         --set space.$sid associated_space=$sid \
#         label.drawing=off \
#         background.drawing=off \
#         icon.padding_left=10 \
#         icon.padding_right=10 \
#         background.padding_left=-5 \
#         background.padding_right=-5 \
#         script="$PLUGIN_DIR/space"
# done
#
# sketchybar --add item spacer.2 left \
#     --set spacer.2 background.drawing=off \
#     label.drawing=off \
#     icon.drawing=off \
#     width=5
#
# sketchybar --add bracket spaces '/space.*/' \
#     --set spaces background.border_width="$BRACKET_BACKGROUND_BORDER_WIDTH" \
#     background.border_color="$red" \
#     background.corner_radius="$BAR_CORNER_RADIUS" \
#     background.color="$BAR_COLOR" \
#     background.height=26 \
#     background.drawing=on
#
# sketchybar --add item separator left \
#     --set separator icon= \
#     icon.font="$FONT:Regular:16.0" \
#     background.padding_left=26 \
#     background.padding_right=15 \
#     label.drawing=off \
#     associated_display=active \
#     icon.color="$YELLOW"
#
#
#
#
#

# sketchybar --add item space_separator left \
--set space_separator icon=󰍹 \
    label.drawing=off background.color=0xfffabd2f background.border_width=0 icon.color=0xff282828
# SPACE_ICONS=("" "" "" "󰀑" "󰒋" "♪" "" "󰙯" "")
#
SPACES=(1, 2, 3, 4, 5, 5, 7)

for i in "${!SPACES[@]}"; do
    sid=$(($i + 1))
    sketchybar --add space space.$sid left \
        --set space.$sid associated_space=$sid \
        icon="${SPACES[i]}" \
        background.drawing=on \
        label.drawing=off \
        script="$PLUGIN_DIR/spaces/scripts/space" \
        click_script="yabai -m space --focus $sid"

done
