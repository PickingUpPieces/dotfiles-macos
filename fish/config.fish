# Set neovim as standard editor
set -Ux EDITOR nvim
set SHELL /bin/bash

# Needed for ansible (python) --> https://github.com/ansible/ansible/issues/32499
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES

# https://stackoverflow.com/questions/54528115/unable-to-extract-tar-file-though-ansible-unarchive-module-in-macos
export PATH="$HOME/.cargo/bin:/usr/local/opt/gnu-tar/libexec/gnubin:$PATH"

# Add Visual Studio Code (code)
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin/"

export PATH="$PATH:/usr/local/opt/flutter/bin/"


alias vim='nvim'

# Solarized for bobthefish theme
set -g theme_color_scheme nord


# After every cd command execute ll
function cd
    if count $argv > /dev/null
        builtin cd "$argv"; and ll
    else
        builtin cd ~; and ll
    end
end
