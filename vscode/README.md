# Visual Studio Code

Create a symlink to the vscode settings folder, which is located differently depending on the platform used.
- MacOS: `/Users/<USERNAME>/Library/Application Support/Code/User`

Symlinks:
- `ln -s ~/.config/vscode/settings.json /Users/<USERNAME>/Library/Application Support/Code/User/settings.json`
- `ln -s ~/.config/vscode/keybindings.json /Users/<USERNAME>/Library/Application Support/Code/User/keybindings.json`

