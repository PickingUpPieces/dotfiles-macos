#!/bin/sh

sketchybar --add alias "$CONTROL_CENTER_NAME,Sound" right    \
           --rename "$CONTROL_CENTER_NAME,Sound" volume      \
           --set volume script="$PLUGIN_DIR/volume.sh"       \
                        updates=on                           \
                        icon.drawing=off                     \
                        alias.color="$WHITE"              \
                        label.drawing=on                     \
                        padding_right=0                            \
                        padding_left=5                            \
                        align=right                                \
           --subscribe volume volume_change 
