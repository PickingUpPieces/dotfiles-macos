-- Tabs and indentation
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.smarttab = true  -- Tab respects 'tabstop', 'shiftwidth', and 'softtabstop'

-- Set backup and swap directories
vim.opt.backupdir = "/tmp"
vim.opt.directory = "/tmp"
vim.opt.swapfile = false  -- Disable swap files

-- File handling
vim.opt.autoread = true  -- Detect when a file is changed

-- Searching
vim.opt.ignorecase = true  -- Case-insensitive searching
vim.opt.hlsearch = false   -- Don't keep search words highlighted
vim.opt.incsearch = true   -- Incremental search like modern browsers

-- UI
vim.opt.showmatch = true  -- Show matching brackets
vim.opt.termguicolors = true     --  enable 256-bit colors
vim.opt.nu = true                 -- set line numbers -- set line numbers
vim.opt.relativenumber = true     -- use relative line numbers
vim.opt.scrolloff = 8   -- Always have 8 lines left to the bottom when scrolling downwards
 

vim.opt.clipboard = 'unnamedplus' -- use system keyboard for yank
 
