#!/bin/sh

sketchybar --add alias  "$CONTROL_CENTER_NAME,Battery" right    \
           --rename     "$CONTROL_CENTER_NAME,Battery" battery  \
           --set        battery icon.drawing=off                   \
                        alias.color="$WHITE"              \
                        update_freq=60                         \
                        updates=on                             \
                        label.drawing=on                       \
                        script="$PLUGIN_DIR/battery.sh"        \
            --subscribe battery power_source_change system_woke
