if vim.g.vscode then
    -- VSCode Neovim
    require("config_vscode")
else
    -- Ordinary Neovim
    require("config")
end
