#!/usr/bin/env bash

source "$CONFIG_DIR/icons.sh"
source "$CONFIG_DIR/colors.sh"

MIC_VOLUME=$(osascript -e 'input volume of (get volume settings)')

if [[ $MIC_VOLUME == "missing value" ]]; then
    COLOR=$GREY
    sketchybar --set $NAME icon=$MICROFON_ON icon.color=$COLOR
elif [[ $MIC_VOLUME -eq 0 ]]; then
    COLOR=$RED
    sketchybar --set $NAME icon=$MICROFON_OFF icon.color=$COLOR
elif [[ $MIC_VOLUME -gt 0 ]]; then
    COLOR=$WHITE
    sketchybar --set $NAME icon=$MICROFON_ON icon.color=$COLOR
fi
