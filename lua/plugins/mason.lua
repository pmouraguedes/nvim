vim.pack.add({
    { src = "https://github.com/mason-org/mason.nvim" },
    { src = "https://github.com/mason-org/mason-lspconfig.nvim" },
})

require("mason").setup()

require("mason-lspconfig").setup({
    -- https://github.com/mason-org/mason-lspconfig.nvim/blob/2304ff65ecc8cb2afc2484de3e2ed9a407edf0b9/lua/mason-lspconfig/filetype_mappings.lua
    ensure_installed = {
        "clangd",
        "gopls",
        "lua_ls",
        "postgres_lsp",
        "tinymist",
    },
    automatic_enable = false,
})
