vim.pack.add({
	{ src = "https://github.com/nvim-mini/mini.pick" },
})

require("mini.pick").setup()

local map = vim.keymap.set
map("n", "<leader><Space>", ":Pick files<CR>")
map("n", "<leader>sh", ":Pick help<CR>")
