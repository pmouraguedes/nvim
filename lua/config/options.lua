-- globals
--------------------------------------------------------------------------------
-- Set <space> as leader key
-- NOTE: Must happen before loading plugins.
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = true

-- plugin globals
-- https://github.com/dhruvasagar/vim-table-mode
vim.g.table_mode_map_prefix = '<leader>m'
--------------------------------------------------------------------------------

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.wrap = true

vim.opt.expandtab = true -- Convert tabs to spaces
vim.opt.shiftwidth = 4 -- Amount to indent with << and >>
vim.opt.tabstop = 4 -- How many spaces are shown per Tab
vim.opt.softtabstop = 4 -- How many spaces are applied when pressing Tab

vim.opt.smarttab = true
vim.opt.smartindent = true
vim.opt.autoindent = true -- Keep identation from previous line
vim.opt.breakindent = true

-- Enable break indent
vim.opt.breakindent = true
vim.opt.clipboard = "unnamedplus"

vim.opt.scrolloff = 10

vim.opt.virtualedit = "block"

-- vim.opt.inccommand = "split"

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.termguicolors = true

-- Show line under cursor
vim.opt.cursorline = true

-- Store undos between sessions
vim.opt.undofile = true

vim.opt.winborder = "rounded"
-- vim.opt.hlsearch = false
vim.opt.cursorcolumn = false
vim.opt.signcolumn = "auto:1-4"

-- Set the default border for all floating windows
vim.opt.winborder = 'rounded'

vim.opt.numberwidth = 4
