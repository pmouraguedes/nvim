vim.pack.add({
    { src = "https://github.com/nvim-tree/nvim-web-devicons" },
    { src = "https://github.com/sindrets/diffview.nvim" },
})

require'nvim-web-devicons'.setup {}

require("diffview").setup({
    file_panel = {
        win_config = { -- See |diffview-config-win_config|
            position = "bottom",
            height = 14,
        },
    },
})

local map = vim.keymap.set
map("n", "<leader>go", "<cmd>DiffviewOpen<cr>", { desc = "Open diff view" })
map("n", "<leader>gc", "<cmd>DiffviewClose<cr>", { desc = "Open diff view" })
