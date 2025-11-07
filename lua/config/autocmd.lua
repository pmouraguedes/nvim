-- autocmd
--------------------------------------------------------------------------------
-- Highlight when yanking
---@diagnostic disable-next-line: param-type-mismatch
vim.api.nvim_create_autocmd('TextYankPost', {
    desc = 'Highlight when yanking (copying) text',
    group = vim.api.nvim_create_augroup('highlight-yank', { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = "dart",
    callback = function()
        vim.opt_local.tabstop = 2      -- Tabs count as 2 spaces
        vim.opt_local.shiftwidth = 2   -- Indentation uses 2 spaces
        vim.opt_local.softtabstop = 2  -- Backspace removes 2 spaces
        vim.opt_local.expandtab = true -- Use spaces instead of tabs
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = "java",
    callback = function()
        vim.opt_local.tabstop = 4       -- Tabs count as 2 spaces
        vim.opt_local.shiftwidth = 4    -- Indentation uses 2 spaces
        vim.opt_local.softtabstop = 4   -- Backspace removes 2 spaces
        vim.opt_local.expandtab = true -- Use spaces instead of tabs
        vim.opt_local.formatexpr = ""   -- Disable  Neovim's default formatter
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = "sql", -- Only activates for SQL files
    callback = function()
        vim.keymap.set(
            "n",
            "<leader>h",
            ":normal vip<CR><PLUG>(DBUI_ExecuteQuery)",
            { desc = "Execute SQL query with dadbod", buffer = true }
        )
    end,
})

-- open help in vertical split
vim.api.nvim_create_autocmd("FileType", {
	pattern = "help",
	command = "wincmd L",
})

-- auto resize splits when the terminal's window is resized
vim.api.nvim_create_autocmd("VimResized", {
	command = "wincmd =",
})

-- no auto continue comments on new line
vim.api.nvim_create_autocmd("FileType", {
	group = vim.api.nvim_create_augroup("no_auto_comment", {}),
	callback = function()
		vim.opt_local.formatoptions:remove({ "c", "r", "o" })
	end,
})


