## Dotfiles
My current dotfiles to make life more productive.

### Tiling Experience
I love i3 (or tiling window managers in general). Thats why I tried to create an as close as possible config to get this feeling on macos.

Tools:
- [yabai](https://github.com/koekeishiya/yabai) (tiling window manager) 
- [skhd](https://github.com/koekeishiya/skhd) (hotkey daemon) 

I've tried to add the scratchpad functionality to macos. You can find two scripts (scratchpad.sh and minimize_scratchpad.sh) which open (and closing, when out of focus) certain applications.

![Screenshot](screenshot.png)

#### Alternative Menu Bar
There are various options for an alternative menu bar (Options to display current focused space).

1. [Uebersicht](https://github.com/felixhageloh/uebersicht ) with [simple-bar](https://github.com/Jean-Tinland/simple-bar): Javascript based bar. Uebersicht can be used for other fancy widgets as well. Compared to the other solutions quiet heavy and has a little delay, but the most beautiful and feature rich one.

2. [Spacebar](https://github.com/cmacrae/spacebar): Minimal bar written in c. Very responsive, but very limited options for adding information.

3. [Bitbar](https://github.com/matryer/bitbar) with [shell script](https://github.com/SxC97/Yabai-Spaces): Puts output of shell script in normal MacOS Menu bar. 

For the first two Solutions, you have to hide MacOS bar (similar to dock): System Preferences -> Dock & Menu Bar -> Automatically hide and show Menu Bar
I'm currently using spacebar.

## Credits
First of all, like most/all dotfiles, a lot of stuff has been found somewhere on the internet (basically reddit or github). Sorry for not crediting!
I've started my yabai and skhd config with https://github.com/Julian-Heng/chunkwm-yabai-config.
