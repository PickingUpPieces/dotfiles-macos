#!/usr/bin/env bash

source "$HOME/.config/sketchybar/colors.sh" # Loads all defined colors
source "$HOME/.config/sketchybar/icons.sh" # Loads all defined icons

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
