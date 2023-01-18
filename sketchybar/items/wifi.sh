#!/usr/bin/env sh
# SOURCE: https://github.com/khaneliman/dotfiles

sketchybar --add alias  "$CONTROL_CENTER_NAME,WiFi" right       \
           --rename     "$CONTROL_CENTER_NAME,WiFi" wifi        \
           --set        wifi    icon.drawing=off                \
                                label.drawing=on                \
                                alias.color="$WHITE"            \
                                updates=on                      \
                                update_freq=5                   \
                                background.padding_right=-5    \
                                script="$PLUGIN_DIR/wifi.sh"    \
