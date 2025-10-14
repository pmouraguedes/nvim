vim.pack.add({
	{ src = "https://github.com/nvim-mini/mini.icons" },
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/mason-org/mason.nvim" },
	{ src = "https://github.com/nvim-lua/plenary.nvim" },
	{ src = "https://github.com/nvim-mini/mini.align" },
	{ src = "https://github.com/sindrets/diffview.nvim" },
	{ src = "https://github.com/NeogitOrg/neogit" },
})
vim.cmd("packadd nohlsearch")

require("mason").setup()
require("mini.icons").setup()
require("plenary").setup()
require("mini.align").setup()
require("diffview").setup()
require("neogit").setup()
