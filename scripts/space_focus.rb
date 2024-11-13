# https://github.com/koekeishiya/yabai/issues/485
# https://github.com/koekeishiya/yabai/issues/878

require 'fileutils'

FILE = "/tmp/yabai_focus_tmp"
HISTORY_SIZE = 5
SLEEP_DURATION = 0.3 # seconds to wait before performing any action

action = ARGV[0]

def log(message)
  STDERR.puts message
end

def read_file
  !File.exist?(FILE) && FileUtils.touch(FILE)
  File.readlines(FILE).map(&:strip)
end

def current_space_id
  `yabai -m query --spaces --space | jq '.index'`.strip
end

def focus_space(space_id)
  log "Focusing on space #{space_id}..."
  system("yabai -m space --focus #{space_id}")
end

# Sleep delay so auto-swoosh by macOS is not the last space AND due to asynchronous behaviour of signals
log "Sleeping for #{SLEEP_DURATION} seconds before executing #{action} action..."
sleep SLEEP_DURATION

log "RUNNING `#{action}`"

case action
when 'write'
  # After delay, retrieve the current space ID and update the space history
  space_id = current_space_id
  space_ids = read_file
  space_ids.unshift(space_id)
  space_ids = space_ids.uniq[0...HISTORY_SIZE] # Ensure no duplicates

  File.open(FILE, 'w+') do |f|
    f.puts(space_ids)
  end

  log "Updated space history: #{space_ids}"

when 'clear'
  # Clear the file if it exists
  File.delete(FILE) if File.exist?(FILE)

when 'read'
  # After delay, read space ID and focus if different from the current space
  space_ids = read_file
  log "Stored space id: #{space_ids[0]}"

  if space_ids[0] != current_space_id
    log "Current space is #{current_space_id}; switching to #{space_ids[0]}"
    focus_space(space_ids[0])
    puts space_ids[0]
  else
    log "Current space is already focused; no action taken."
  end

else
  raise "Unknown action `#{action}`"
end

