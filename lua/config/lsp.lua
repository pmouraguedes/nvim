-- lsp
--------------------------------------------------------------------------------
-- See https://gpanders.com/blog/whats-new-in-neovim-0-11/ for a nice overview
-- of how the lsp setup works in neovim 0.11+.

-- This actually just enables the lsp servers.
-- The configuration is found in the lsp folder inside the nvim config folder,
-- so in ~.config/lsp/lua_ls.lua for lua_ls, for example.

-- Use vim.lsp.enable('…') (not require'lspconfig'.….setup{}) to enable a config, so that it activates for its filetypes.
vim.lsp.enable({
    "lua_ls",
    "gopls",
    "clangd",
    "tinymist",
    "protols",
})

vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(ev)
        local client = vim.lsp.get_client_by_id(ev.data.client_id)
        local bufnr = ev.buf

        if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_completion) then
            vim.opt.completeopt = { "menu", "menuone", "noinsert", "fuzzy", "popup" }
            vim.lsp.completion.enable(true, client.id, bufnr, { autotrigger = true })
            vim.keymap.set("i", "<C-Space>", function()
                vim.lsp.completion.get()
            end)
        end
        if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint) then
            vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
        else
            vim.print("inlay hints not supported")
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
            vim.print("document_highlight not supported")
        end
    end,
})

-- Diagnostics
vim.diagnostic.config({
    -- Use the default configuration
    -- virtual_lines = true,

    -- Alternatively, customize specific options
    virtual_lines = {
        -- Only show virtual line diagnostics for the current cursor line
        current_line = true,
    },
})

-- Code actions and refactoring
-- vim.keymap.set({ "n", "v" }, '<leader>ca', function() vim.lsp.buf.code_action() end, { desc = "Code action" })
