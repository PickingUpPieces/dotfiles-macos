#! /usr/bin/env sh

read -r -d '' action <<- 'EOF'
  recent_space_index="$(yabai -m query --spaces | jq -er 'map(select(.id | tostring == env.YABAI_RECENT_SPACE_ID))[0].index')"
  echo recent_space_index
  if yabai -m query --windows --space "${recent_space_index}" |
    jq -er 'length == 0'
  then
    yabai -m space "${recent_space_index}" --destroy
  fi
EOF

yabai -m signal --add event='space_changed' action="${action}"
