vim.pack.add({
    { src = "https://github.com/stevearc/conform.nvim" },
})

require("conform").setup({
    formatters_by_ft = {
        -- You can customize some of the format options for the filetype (:help conform.format)
        rust = { "rustfmt" },
        go = { "goimports", "gofmt" },
    },
    default_format_opts = {
        lsp_format = "fallback",
    },
})

vim.keymap.set("n", "<leader>cf", function() require("conform").format() end, { desc = "Format" })
