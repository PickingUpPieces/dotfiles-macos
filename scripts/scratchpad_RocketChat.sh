#!/usr/bin/env bash
# Generic Scratchpad script
# $1 (First parameter): Program name

scratchpad_id=$(yabai -m query --windows | jq --arg program "$1" '.[] | select(.app==$program).id')
echo $scratchpad_id

if [[ "$scratchpad_id" -lt 1 ]]; then
  scratchpad_id=$(open -a "Rocket.Chat.app" | awk '{print $NF}')
  sleep 1
  yabai -m window --focus "$scratchpad_id"
  yabai -m window --grid 6:6:1:1:4:4
else
  is_minimized=$(yabai -m query --windows --window "$scratchpad_id" | jq '.minimized')
  current_space=$(yabai -m query --spaces --space | jq '.index')

  echo $is_minimized
  echo $current_space

  if [[ "$is_minimized" -eq 1 ]]; then
    yabai -m window "$scratchpad_id" --space "$current_space"
    yabai -m window --focus "$scratchpad_id"
    yabai -m window --grid 6:6:1:1:4:4
  else
    yabai -m window --focus recent
    yabai -m window "$scratchpad_id" --minimize
  fi
fi
