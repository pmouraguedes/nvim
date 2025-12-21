vim.pack.add({
    { src = "https://github.com/neovim/nvim-lspconfig" },
    { src = "https://github.com/NeogitOrg/neogit" },
    { src = "https://github.com/dimtion/guttermarks.nvim" },
    { src = "https://github.com/lewis6991/gitsigns.nvim" },
    { src = "https://github.com/chomosuke/typst-preview.nvim" },
    { src = "https://github.com/pmouraguedes/sql-ghosty.nvim" },
})
-- vim.cmd("packadd nohlsearch")

require("neogit").setup()
require("guttermarks").setup()
require('gitsigns').setup()
require 'typst-preview'.setup()
require("sql-ghosty").setup()
