vim.pack.add({
    { src = "https://github.com/stevearc/conform.nvim" },
})

require("conform").setup({
    formatters_by_ft = {
        rust = { "rustfmt" },
        go = { "goimports", "gofmt" },
        c = { "clang-format" },
        cpp = { "clang-format" },
        typst = { "typstyle", lsp_format = "prefer" },
    },
    default_format_opts = {
        lsp_format = "fallback",
    },
})

vim.keymap.set("n", "<leader>cf", function() require("conform").format() end, { desc = "Format" })
