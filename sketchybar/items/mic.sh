#!/bin/sh

sketchybar --add item mic right                                \
           --set mic update_freq=5                             \
                     updates=on                                \
                     icon=$MICROFON_ON                         \
                     icon.drawing=on                           \
                     script="$PLUGIN_DIR/mic.sh"               \
                     click_script="$PLUGIN_DIR/mic_click.sh"   \

