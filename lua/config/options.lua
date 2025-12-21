-- globals
--------------------------------------------------------------------------------
-- Set <space> as leader key
-- NOTE: Must happen before loading plugins.
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = true

--------------------------------------------------------------------------------
vim.opt.number = true
vim.opt.relativenumber = true
-- Show line under cursor
vim.opt.cursorline = true
vim.opt.wrap = true
vim.opt.scrolloff = 10
vim.opt.sidescrolloff = 8

vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.expandtab = true -- Convert tabs to spaces
vim.opt.shiftwidth = 4 -- Amount to indent with << and >>
vim.opt.tabstop = 4 -- How many spaces are shown per Tab
vim.opt.softtabstop = 4 -- How many spaces are applied when pressing Tab

vim.opt.smarttab = true
vim.opt.smartindent = true
vim.opt.autoindent = true -- Keep identation from previous line
vim.opt.breakindent = true

vim.opt.clipboard = "unnamedplus"

vim.opt.virtualedit = "block"

-- Store undos between sessions
vim.opt.undofile = true

-- vim.opt.inccommand = "split"

-- search
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- visual
vim.opt.termguicolors = true

vim.opt.winborder = "rounded"
vim.opt.cursorcolumn = false
vim.opt.signcolumn = "auto:1-4"
vim.opt.statuscolumn = "%s"     -- Signs/marks (left)
  .. "%="                       -- Filler / separator (collapses if empty)
  .. "%l  "                     -- Numbers + 2-space gap
  .. "%="                       -- Filler

-- Set the default border for all floating windows
vim.opt.winborder = 'rounded'

vim.opt.numberwidth = 4

vim.o.updatetime = 500

-- behavior
vim.opt.iskeyword:append("-")
vim.opt.path:append "**"
vim.opt.wildignore:append({ "*.o", "*.obj", "*.pyc", "*.class", "*.jar" })
