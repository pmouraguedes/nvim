vim.pack.add({
	{ src = "https://github.com/nvim-mini/mini.icons" },
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/mason-org/mason.nvim" },
	{ src = "https://github.com/nvim-mini/mini.ai" },
	{ src = "https://github.com/nvim-lua/plenary.nvim" },
	{ src = "https://github.com/nvim-mini/mini.align" },
})

require("mason").setup()
require("mini.icons").setup()
require("mini.ai").setup()
require("plenary").setup()
require("mini.align").setup()
