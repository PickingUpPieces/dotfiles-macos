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

# Add brew path to PATH
if type -q brew 
    export PATH="$PATH:$(brew --prefix)"
end


alias vim='nvim'

set -x LANG en_US.UTF-8
set -g theme_nerd_fonts yes
set -g theme_color_scheme nord


# After every cd command execute ll
function cd
    if count $argv > /dev/null
        builtin cd "$argv"; and ll
    else
        builtin cd ~; and ll
    end
end


# Git Aliases
alias add="git add"
alias commit="git commit"
alias pull="git pull"
alias stat="git status"
alias gdiff="git diff HEAD"
alias vdiff="git difftool HEAD"
alias log="git log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias cfg="git --git-dir=$HOME/dotfiles/ --work-tree=$HOME"
alias push="git push"

