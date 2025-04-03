# nvim config

# Installation

## Ubuntu/Debian
Install neovim from ppa to get newer version:

```
sudo add-apt-repository ppa:neovim-ppa/stable
# Or /unstable for the brave ones
sudo apt update
```

## Package Manager
As package manager i use [lazy](https://github.com/folke/lazy.nvim), which needs to be cloned as written in the repos README.

## Dependencies
- ripgrep

## Plugins
- [telescope](https://github.com/nvim-telescope/telescope.nvim)
- [nord](https://github.com/gbprod/nord.nvim)
- autopairs
- todo-comments
- treesitter
- leetcode

## ROS2 Setup
If c++ is used with clangd, generate the `compile_commands.json` with colcon with `colcon build --cmake-args -DCMAKE_EXPORT_COMPILE_COMMANDS=ON`.
