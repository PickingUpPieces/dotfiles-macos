#!/bin/sh

sketchybar --add slider volume right                          \
           --set volume script="$PLUGIN_DIR/volume.sh"        \
                        updates=on                            \
                        icon.drawing=off                      \
                        label.drawing=off                     \
                        padding_left=0                        \
                        padding_right=0                       \
                        slider.highlight_color=$BLUE          \
                        slider.background.height=5            \
                        slider.background.corner_radius=3     \
                        slider.background.color=$BACKGROUND_2 \
                        slider.knob=􀀁                         \
           --subscribe volume volume_change mouse.clicked

sketchybar --add alias "Control Centre,Sound" right                      \
           --rename "Control Centre,Sound" volume_alias                  \
           --set volume_alias icon.drawing=off                           \
                              label.drawing=off                          \
                              alias.color=$WHITE                         \
                              padding_right=0                            \
                              padding_left=-5                            \
                              width=50                                   \
                              align=right                                \
                              click_script="$PLUGIN_DIR/volume_click.sh"

sketchybar --add bracket status brew github.bell volume volume_alias \
           --set status background.color=$BACKGROUND_1               \
                        background.border_color=$BACKGROUND_2        \
                        background.border_width=2
