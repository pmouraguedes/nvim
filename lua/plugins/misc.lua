vim.pack.add({
    { src = "https://github.com/neovim/nvim-lspconfig" },
    { src = "https://github.com/nvim-lua/plenary.nvim" },
    { src = "https://github.com/sindrets/diffview.nvim" },
    { src = "https://github.com/NeogitOrg/neogit" },
    { src = "https://github.com/dimtion/guttermarks.nvim" },
    { src = "https://github.com/lewis6991/gitsigns.nvim" },
})
vim.cmd("packadd nohlsearch")

require("diffview").setup()
require("neogit").setup()
require("guttermarks").setup()
require('gitsigns').setup()

