#!/usr/bin/env bash

window_state() {
  source "$HOME/.config/sketchybar/colors.sh"
  source "$HOME/.config/sketchybar/icons.sh"

  WINDOW=$(yabai -m query --windows --window)
  CURRENT=$(echo "$WINDOW" | jq '.["stack-index"]')

  args=()
  if [[ $CURRENT -gt 0 ]]; then
    LAST=$(yabai -m query --windows --window stack.last | jq '.["stack-index"]')
    args+=(--set $NAME icon=$YABAI_STACK icon.color=$RED label.drawing=on label=$(printf "[%s/%s]" "$CURRENT" "$LAST"))
    yabai -m config active_window_border_color $RED > /dev/null 2>&1 &

  else 
    args+=(--set $NAME label.drawing=off)
    case "$(echo "$WINDOW" | jq '.["is-floating"]')" in
      "false")
        if [ "$(echo "$WINDOW" | jq '.["has-fullscreen-zoom"]')" = "true" ]; then
          args+=(--set $NAME icon=$YABAI_FULLSCREEN_ZOOM icon.color=$GREEN)
          yabai -m config active_window_border_color $GREEN > /dev/null 2>&1 &
        elif [ "$(echo "$WINDOW" | jq '.["has-parent-zoom"]')" = "true" ]; then
          args+=(--set $NAME icon=$YABAI_PARENT_ZOOM icon.color=$BLUE)
          yabai -m config active_window_border_color $BLUE > /dev/null 2>&1 &
        else
          args+=(--set $NAME icon=$YABAI_GRID icon.color=$ORANGE)
          yabai -m config active_window_border_color $WHITE > /dev/null 2>&1 &
        fi
        ;;
      "true")
        args+=(--set $NAME icon=$YABAI_FLOAT icon.color=$MAGENTA)
        yabai -m config active_window_border_color $MAGENTA > /dev/null 2>&1 &
        ;;
    esac
  fi

  sketchybar -m "${args[@]}"
}

windows_on_spaces () {
  CURRENT_SPACES="$(yabai -m query --displays | jq -r '.[].spaces | @sh')"

  args=()
  while read -r line
  do
    for space in $line
    do
      icon_strip=" "
      apps=$(yabai -m query --windows --space $space | jq -r ".[].id")
      if [ "$apps" != "" ]; then
        while IFS= read -r app; do
          # DONT SHOW WINDWOS WHICH ARE HIDDEN
          window=$(yabai -m query --windows --space $space | jq --arg id "$app" '.[] | select(.id==($id|tonumber))')
          window_app=$(echo $window | jq '.app' | tr -d '"') # Remove quotes from string
          window_title=$(echo $window | jq '.title' | tr -d '"') # Remove quotes from string
          window_minimized=$(echo $window | jq '."is-minimized"')

          if [ "$window_title" == "Microsoft Teams Notification" ]; then
              continue
          fi

          if [[ $window_title == *"Microsoft Teams Call"* ]]; then
              continue
          fi

          if [[ "$window_minimized" == "false" ]]; then
             icon_strip+=" $($HOME/.config/sketchybar/plugins/icon_map.sh $window_app)"
          fi

          # ONLY HIDE SCRATCHPAD WINDOWS
          #TEST=1 # true as default
          #for sapp in "${HIDE_APPLICATION_ICONS[@]}" 
          #do
          #  if [[ "$sapp" = "$app" ]]; then
          #      TEST=0 # set to false , if scratchpad window
          #  fi
          #done
          #if [ $TEST -eq 1 ] ; then
          #  icon_strip+=" $($HOME/.config/sketchybar/plugins/icon_map.sh "$app")"
          #fi
        done <<< "$apps"
      fi
      args+=(--set space.$space label="$icon_strip" label.drawing=on)
    done
  done <<< "$CURRENT_SPACES"

  sketchybar -m "${args[@]}"
}

mouse_clicked() {
  yabai -m window --toggle float
  window_state
}

case "$SENDER" in
  "mouse.clicked") mouse_clicked
  ;;
  "forced") exit 0
  ;;
  "window_focus") window_state 
  ;;
  "windows_on_spaces") windows_on_spaces
  ;;
esac
