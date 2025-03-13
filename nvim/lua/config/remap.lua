vim.g.mapleader = " "

-- Disable arrow keys in normal mode
vim.keymap.set("", "<Up>", "<NOP>", { noremap = true, silent = true })
vim.keymap.set("", "<Down>", "<NOP>", { noremap = true, silent = true })
vim.keymap.set("", "<Left>", "<NOP>", { noremap = true, silent = true })
vim.keymap.set("", "<Right>", "<NOP>", { noremap = true, silent = true })

-- Move to the end of the line
vim.keymap.set("", "<C-e>", "$", { desc = "Custom: Move to end of line" })

-- Map esc to ctrl + c
vim.keymap.set("i", "<C-c>", "<Esc>", { desc = "Custom: esc == ctrl+c"})

-- Map esc to kk
vim.keymap.set('i', 'kk', '<Esc>', { desc = "Custom: esc == kk"})

-- Select all
vim.keymap.set("n", "<C-a>", "ggVG", { desc = "Custom: Select all" })

local function save_or_prompt()
  if vim.fn.expand('%') == '' then
    vim.cmd('echohl ErrorMsg | echo "No file name. Use :saveas <filename>" | echohl None')
  else
    vim.cmd('w')
  end
end

local function save_or_close()
  if vim.fn.expand('%') == '' then
    vim.cmd('q!')
  else
    vim.cmd('wq')
  end
end

vim.keymap.set("n", "<leader>w", save_or_prompt, { desc = "Custom: save file or prompt if no name" })

vim.keymap.set("n", "<leader>q", save_or_close, { desc = "Custom: save and close or quit if no name" })
