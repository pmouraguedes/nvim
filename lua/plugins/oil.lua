vim.pack.add({
	{ src = "https://github.com/stevearc/oil.nvim" },
})

-- Optional dependencies
-- dependencies = { { "echasnovski/mini.icons", opts = {} } },
require("oil").setup({
	view_options = {
		show_hidden = true,
	},
	keymaps = {
		["-"] = { "actions.parent", mode = "n" },
		["<CR>"] = "actions.select", -- This will map <CR> to select
		["<C-l>"] = "actions.select", -- You can use any other key combination if you like
	},
	use_default_keymaps = true,
})

vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
