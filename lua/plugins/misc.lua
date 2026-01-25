vim.pack.add({
    { src = "https://github.com/neovim/nvim-lspconfig" },
    { src = "https://github.com/NeogitOrg/neogit" },
    { src = "https://github.com/dimtion/guttermarks.nvim" },
    { src = "https://github.com/lewis6991/gitsigns.nvim" },
    { src = "https://github.com/chomosuke/typst-preview.nvim" },
    { src = "https://github.com/pmouraguedes/sql-ghosty.nvim" },
    { src = "https://github.com/jeetsukumaran/vim-buffergator" },
})
-- vim.cmd("packadd nohlsearch")

require("neogit").setup()
require("guttermarks").setup()
require('gitsigns').setup()
require 'typst-preview'.setup()
require("sql-ghosty").setup()

-- buffergator
vim.g.buffergator_sort_regime = "mru"
vim.g.buffergator_mru_order_reverse = 0
vim.g.buffergator_show_full_buffer_name = 0
vim.g.buffergator_show_full_directory_path = 0

