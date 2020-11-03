# Set neovim as standard editor
set -Ux EDITOR nvim


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
