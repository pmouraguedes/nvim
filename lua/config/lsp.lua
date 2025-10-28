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
})

vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(ev)
        local client = vim.lsp.get_client_by_id(ev.data.client_id)
        if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_completion) then
            vim.opt.completeopt = { "menu", "menuone", "noinsert", "fuzzy", "popup" }
            vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
            vim.keymap.set("i", "<C-Space>", function()
                vim.lsp.completion.get()
            end)
        end
        if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint) then
            vim.lsp.inlay_hint.enable(true, { bufnr = ev.buf })
        else
            vim.print("inlay hints not supported")
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
