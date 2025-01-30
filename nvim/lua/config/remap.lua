vim.g.mapleader = " "

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = "Return to file explorer" })

-- Disable arrow keys in normal mode
vim.keymap.set("", "<Up>", "<NOP>", { noremap = true, silent = true })
vim.keymap.set("", "<Down>", "<NOP>", { noremap = true, silent = true })
vim.keymap.set("", "<Left>", "<NOP>", { noremap = true, silent = true })
vim.keymap.set("", "<Right>", "<NOP>", { noremap = true, silent = true })

-- Map esc to ctrl + c
vim.keymap.set("i", "<C-c>", "<Esc>", { desc = "esc == ctrl+c"})

-- Map esc to kk
vim.keymap.set('i', 'kk', '<Esc>', { desc = "esc == kk"})

-- Select all
vim.keymap.set("n", "<C-a>", "ggVG", { desc = "Select all" })
