#!/usr/bin/env bash

source "$HOME/.config/sketchybar/colors.sh"
source "$HOME/.config/sketchybar/icons.sh"

#CURRENT_WIFI="$(networksetup -getairportnetwork en0)"
SSID="$(ipconfig getsummary en0 | awk -F ' SSID : '  '/ SSID : / {print $2}')"
IP_ADDRESS=$(scutil --nwi | grep address | sed 's/.*://' | tr -d ' ' | head -1)
IS_VPN=$(scutil --nwi | grep -m1 'utun' | awk '{ print $1 }')

args=()

if [[ $IS_VPN != "" ]]; then
    args+=(--set "$NAME" label="$SSID $VPN $IP_ADDRESS" \
                            label.drawing=on \
                            icon=$VPN \
                            alias.color="$CYAN")
elif [ "$SSID" = "" ]; then
    args+=(--set "$NAME" label="No WLAN" \
                            label.drawing=on \
                            icon=$NO_INTERNET \
                            alias.color="$RED")
else
    args+=(--set "$NAME"    label="$SSID $IP_ADDRESS" \
                            label.drawing=on \
                            alias.color="$WHITE" )
fi

sketchybar -m "${args[@]}" > /dev/null
