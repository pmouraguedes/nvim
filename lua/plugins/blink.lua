vim.pack.add({
    -- { src = "https://github.com/L3MON4D3/LuaSnip" }, -- dependency
    -- { src = "https://github.com/rafamadriz/friendly-snippets" }, -- dependency
    { src = "https://github.com/saghen/blink.cmp" },
})

-- build with:
-- cargo build --release

require("blink.cmp").setup({
    sources = {
        default = { "lsp", "path", "snippets", "buffer" },
        per_filetype = {
            sql = { 'snippets', 'dadbod', 'buffer' },
        },
        providers = {
            dadbod = { name = "Dadbod", module = "vim_dadbod_completion.blink" },
        },
    },
})
