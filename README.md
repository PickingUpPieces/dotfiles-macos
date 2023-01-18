# Dotfiles
My current dotfiles for making life more fun.

## Tiling Experience
I love i3 (or tiling window managers in general). That's why I tried to create an as close as possible experience on macos.
Due to the signals happening asynchronously, there are definetly some bugs/glitches in general but especially when changing focus/spaces really quick after another.
Since this config tries to outsmart the native window manager at some points, this can lead to problems as well.

![Screenshot](screenshot.png)


Features of this config:
1. Scratchpad functionality
2. Automatic empty space cleanup
3. Anti-window-swoosh (macOS changes spaces without asking)
4. More intuitive window focusing


### Known Issues
- Setting automatically the correct focus on a window is sometimes not working. 
- SketchyBar doesn't reflect a newly created desktop well. 


### Dependencies
- [yabai](https://github.com/koekeishiya/yabai) (tiling window manager) 
- [skhd](https://github.com/koekeishiya/skhd) (hotkey daemon) 
- [SketchyBar](https://github.com/FelixKratz/SketchyBar) (alternative menu bar)
- [jq](https://stedolan.github.io/jq/) (cmd-line json processor)


### Scratchpad 
I've tried to add the scratchpad functionality to macos. You can find two scripts (`scratchpad.sh`, `minimize_scratchpad.sh`), which open (and closing, when out of focus) certain applications.
For adding a new application which should open in "scratchpad"-mode
1. Find out the application name (sometimes not as obvious as it should). Go to a space where an instance (a window) of the application is running. Open a terminal and enter ` yabai -m query --windows --space | grep app`.
2. Choose a key binding that suits you and add it to _skhdrc_ e.g. `alt - b : ~/.config/scripts/scratchpad.sh $application_name` (e.g. Bitwarden)
3. Tell yabai that it shouldn't manage this application by adding a rule to the _yabairc_ file e.g. `yabai -m rule --add label="TickTick" app="^TickTick$" manage=off `
4. If you want to leaverage the auto-minimize functionality, add the _$application\_name_ to the `minimize_scratchpad_apps` function in the _yabairc_ file.


### Empty space cleanup
For convenience the script `destroy_empty_space.sh` is triggered by every space change. It checks if any open video is left on the space. If this isn't the case (and no or only minimized/hidden windows are left) it delets the space. 


### Anti-swoosh 
When a window gets terminated the default macOS behaviour is switching to the recent focused window. Even if this is on another space. Since this is not very intuitive (personal preference) this is changed by the ruby script `space_focus.rb`. If this isn't desired then you have to deactivate everything in the _yabairc_ file under _Anti-swoosh_.
Since the original macOS behaviour can't be deactivated, you can see that spaces are changed. With the script you should at least end up on the previous space.


### Alternative Menu Bar
There are various options for an alternative menu bar (Options to display current focused space):

1. [Uebersicht](https://github.com/felixhageloh/uebersicht ) with [simple-bar](https://github.com/Jean-Tinland/simple-bar) (or any other Uebersicht bar): Javascript based bar. Uebersicht can be used for other fancy widgets as well. Compared to the other solutions, it is quiet heavy and has a little delay, but it's the most beautiful and feature rich option.

2. [Spacebar](https://github.com/cmacrae/spacebar): Minimal bar written in c. Very responsive, but very limited options for adding information.

3. [SketchyBar](https://github.com/FelixKratz/SketchyBar): This bar project aims to create a highly flexible, customizable, fast menu bar.

4. [Bitbar](https://github.com/matryer/bitbar) with [shell script](https://github.com/SxC97/Yabai-Spaces): Just puts output of shell scripts (In this case all spaces listed) in the normal macos Menu bar. 

For the first three solutions, you have to hide macos bar (similar to dock): `System Preferences` --> `Dock & Menu Bar` --> `Automatically hide and show Menu Bar`

In this repository *SketchyBar* is used.
*Setup of SketchyBar*:
1. Install required dependencies:
    - [jq](https://stedolan.github.io/jq/) (cmd-line json processor)
    - [sf-symbols](https://formulae.brew.sh/cask/sf-symbols) (font for the icons)
    - [sketchybar-app-font](https://github.com/kvndrsslr/sketchybar-app-font): Install with `curl -L https://github.com/kvndrsslr/sketchybar-app-font/releases/download/v1.0.4/sketchybar-app-font.ttf -o $HOME/Library/Fonts/sketchybar-app-font.ttf`
2. The following items must be activated to show up in the original apple menu bar:
    - WiFi
    - Volume
    - Battery (Without percentage)

More details can be found at https://github.com/FelixKratz/dotfiles.
Note: Only applications which aren't hidden are shown in the left menu bar as icon. If you want all applications which are on the specific space/desktop, you have to edit the file `sketchybar/plugins/yabai.sh`.

### Credits
Like most/all dotfiles, a lot of stuff has been found somewhere on the internet (basically reddit or github). Sorry for not crediting!
I've started my yabai and skhd config with https://github.com/Julian-Heng/chunkwm-yabai-config.
The sketchybar config is based on https://github.com/FelixKratz/dotfiles.

Also interesting:
- https://github.com/camspiers/dotfiles
- https://github.com/stephen-huan/macos-dotfiles
- https://github.com/koekeishiya/dotfiles
