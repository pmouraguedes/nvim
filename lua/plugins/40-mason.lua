vim.pack.add({
    { src = "https://github.com/mason-org/mason.nvim" },
    { src = 'https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim' },
})

require("mason").setup()

require('mason-tool-installer').setup({
    -- mason package names (see :Mason), not lspconfig server names
    ensure_installed = {
        "clangd",
        "gopls",
        "lua-language-server",
        "stylua",
        "postgres-language-server",
        "tinymist",
        "rust-analyzer",
        "jdtls",
        "protols",
        "pyright",
    },
    integrations = {
        ["mason-lspconfig"] = false,
    },
})
