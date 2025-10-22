vim.pack.add({
    { src = "https://github.com/sindrets/diffview.nvim" },
})

require("diffview").setup()

local map = vim.keymap.set

map("n", "<leader>go", "<cmd>DiffviewOpen<cr>", { desc = "Open diff view" })
map("n", "<leader>gc", "<cmd>DiffviewClose<cr>", { desc = "Open diff view" })

