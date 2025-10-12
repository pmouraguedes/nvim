vim.pack.add({
	{ src = "https://github.com/kdheepak/lazygit.nvim" },
})

vim.keymap.set("n", "<leader>gg", "<cmd>LazyGit<cr>", { desc = "LazyGit" })
