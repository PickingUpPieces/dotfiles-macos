# https://github.com/koekeishiya/yabai/issues/485
# https://github.com/koekeishiya/yabai/issues/878

require 'fileutils'

FILE="/tmp/yabai_focus_tmp"
HISTORY_SIZE=5

action = ARGV[0]
value = ARGV[1]

def log(message)
  STDERR.puts message
end

def read_file
  !File.exist?(FILE) && FileUtils.touch(FILE)

  File.readlines(FILE).map do |item|
    item.strip
  end
end

log "RUNNING `#{action}` - `#{value}`"

case action
when 'write'
  space_ids = read_file
  space_ids.unshift(value)

  space_ids = space_ids[0...HISTORY_SIZE]

  File.open(FILE, 'w+') do |f|
    f.puts(space_ids)
  end

  log "new space ids: #{space_ids}"

when 'clear'
  File.delete(FILE)

when 'read'
  space_ids = read_file
  puts space_ids[0]

else
  raise "Unknown action `#{action}`"
end
