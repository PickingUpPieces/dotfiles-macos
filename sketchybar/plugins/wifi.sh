#!/usr/bin/env bash

source "$HOME/.config/sketchybar/colors.sh"
source "$HOME/.config/sketchybar/icons.sh"

CURRENT_WIFI="$(/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport -I)"
SSID="$(echo "$CURRENT_WIFI" | grep -o "SSID: .*" | sed 's/^SSID: //')"

args=()

if [ "$SSID" = "" ]; then
    args+=(--set "$NAME" label="N/A" \
                            label.drawing=on)
else
    args+=(--set "$NAME"    label="$SSID" \
                            label.drawing=on) # remove if you want more detailed info available without hovering
fi

sketchybar -m "${args[@]}" > /dev/null
