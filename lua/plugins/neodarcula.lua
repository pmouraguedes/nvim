vim.pack.add({
	{ src = "https://github.com/pmouraguedes/neodarcula.nvim" },
})

require("neodarcula").setup({
	transparent = false,
	dim = true,
})
vim.cmd([[colorscheme neodarcula]])
