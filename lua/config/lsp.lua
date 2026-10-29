-- lsp
--------------------------------------------------------------------------------
-- See https://gpanders.com/blog/whats-new-in-neovim-0-11/ for a nice overview
-- of how the lsp setup works in neovim 0.11+.

-- This actually just enables the lsp servers.
-- The configuration is found in the lsp folder inside the nvim config folder,
-- so in ~.config/lsp/lua_ls.lua for lua_ls, for example.

-- Use vim.lsp.enable('…') (not require'lspconfig'.….setup{}) to enable a config, so that it activates for its filetypes.
-- Servers are installed by mason (see plugins/40-mason.lua); rust_analyzer is
-- left out on purpose, rustaceanvim starts it.
vim.lsp.enable({
    "clangd",
    "gopls",
    "jdtls",
    "lua_ls",
    "postgres_lsp",
    "protols",
    "pyright",
    "stylua",
    "tinymist",
})

vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(ev)
        local client = vim.lsp.get_client_by_id(ev.data.client_id)
        local bufnr = ev.buf

        if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_completion) then
            -- the popup itself comes from 'autocomplete' (see options.lua); this adds
            -- trigger characters (e.g. ".") and applies snippets/imports on <C-y>
            vim.lsp.completion.enable(true, client.id, bufnr, { autotrigger = true })
            vim.keymap.set("i", "<C-Space>", function()
                vim.lsp.completion.get()
            end, { buffer = bufnr })
        end
        if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint) then
            vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
        else
            -- vim.print("inlay hints not supported")
        end
        -- LSP reference highlighting (LspReferenceText, LspReferenceRead, etc.)
        if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight) then
            local highlight_augroup = vim.api.nvim_create_augroup("lsp_document_highlight", { clear = false })
            vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
                buffer = bufnr,
                group = highlight_augroup,
                callback = vim.lsp.buf.document_highlight,
            })
            vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
                buffer = bufnr,
                group = highlight_augroup,
                callback = vim.lsp.buf.clear_references,
            })
        else
            -- vim.print("document_highlight not supported")
        end
    end,
})

-- Diagnostics
-- only signs and underlines by default; details on demand with <leader>cd (float)
-- or <leader>cD (toggle virtual lines for the current line)
vim.diagnostic.config({
    virtual_lines = false,
})

vim.keymap.set("n", "<leader>cD", function()
    local enabled = vim.diagnostic.config().virtual_lines
    vim.diagnostic.config({ virtual_lines = not enabled and { current_line = true } or false })
end, { desc = "Toggle diagnostic virtual lines" })

-- Code actions and refactoring
-- vim.keymap.set({ "n", "v" }, '<leader>ca', function() vim.lsp.buf.code_action() end, { desc = "Code action" })
