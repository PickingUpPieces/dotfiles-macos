#!/usr/bin/env sh
# SOURCE: https://github.com/khaneliman/dotfiles

sketchybar --add alias  "$CONTROL_CENTER_NAME,WiFi" right                      \
           --rename     "$CONTROL_CENTER_NAME,WiFi" wifi                \
           --set        wifi    icon.drawing=off                   \
                                alias.color="$YELLOW"              \
                                background.padding_right=-20        \
                                align=right                        \
                                script="$PLUGIN_DIR/wifi.sh"       \
                                update_freq=3                      \
