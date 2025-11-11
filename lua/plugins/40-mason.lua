vim.pack.add({
    { src = "https://github.com/mason-org/mason.nvim" },
    { src = "https://github.com/mason-org/mason-lspconfig.nvim" },
    { src = 'https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim' },
})

require("mason").setup()

require("mason-lspconfig").setup({
    automatic_enable = {
        exclude = {
        }
    }
})

require('mason-tool-installer').setup({
    -- https://github.com/mason-org/mason-lspconfig.nvim/blob/2304ff65ecc8cb2afc2484de3e2ed9a407edf0b9/lua/mason-lspconfig/filetype_mappings.lua
    ensure_installed = {
        "clangd",
        "gopls",
        "lua_ls",
        "stylua",
        "postgres_lsp",
        "tinymist",
        "rust_analyzer",
        "jdtls",
        "protols",
    },
})
