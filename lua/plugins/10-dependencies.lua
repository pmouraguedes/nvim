vim.pack.add({
    { src = "https://github.com/nvim-lua/plenary.nvim" },
    { src = "https://github.com/nvim-neotest/nvim-nio" },
    { src = "https://github.com/L3MON4D3/LuaSnip" },
    { src = "https://github.com/rafamadriz/friendly-snippets" },
    { src = "https://github.com/nvim-tree/nvim-web-devicons" },
    { src = "https://github.com/antoinemadec/FixCursorHold.nvim" },
})

require'nvim-web-devicons'.setup {}

require("luasnip.loaders.from_vscode").lazy_load()
