vim.pack.add({
	{ src = "https://github.com/nvim-mini/mini.icons" },
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/mason-org/mason.nvim" },
})

require("mason").setup()
require("mini.icons").setup()
