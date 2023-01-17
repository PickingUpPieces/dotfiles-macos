#!/bin/sh

sketchybar --add alias "$CONTROL_CENTER_NAME,Sound" right    \
           --rename "$CONTROL_CENTER_NAME,Sound" volume      \
           --set volume script="$PLUGIN_DIR/volume.sh"       \
                        updates=on                           \
                        icon.drawing=off                     \
                        label.drawing=on                     \
           --subscribe volume volume_change 
