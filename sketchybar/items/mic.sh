#!/bin/sh

sketchybar --add item mic right                                 \
           --set mic update_freq=5                              \
                     updates=on                                 \
                     icon.drawing=on                            \
                     padding_left=0                  \
                     padding_right=4                  \
                     label.drawing=off                          \
                     script="$PLUGIN_DIR/mic.sh"                \
                     click_script="$PLUGIN_DIR/mic_click.sh"    \

