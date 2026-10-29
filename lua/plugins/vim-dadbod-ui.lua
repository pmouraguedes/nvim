vim.pack.add({
    { src = "https://tpope.io/vim/dadbod.git" },
    { src = "https://github.com/kristijanhusak/vim-dadbod-completion" },
    { src = "https://github.com/kristijanhusak/vim-dadbod-ui" },
})

local data_path = vim.fn.stdpath("data")

vim.g.db_ui_auto_execute_table_helpers = 1
vim.g.db_ui_save_location = data_path .. "/dadbod_ui"
vim.g.db_ui_show_database_icon = true
vim.g.db_ui_tmp_query_location = data_path .. "/dadbod_ui/tmp"
vim.g.db_ui_use_nerd_fonts = true
vim.g.db_ui_use_nvim_notify = true

-- NOTE: The default behavior of auto-execution of queries on save is disabled
-- this is useful when you have a big query that you don't want to run every time
-- you save the file running those queries can crash neovim to run use the
-- default keymap: <leader>S
vim.g.db_ui_execute_on_save = false

vim.keymap.set("n", "<leader>D", "<cmd>DBUIToggle<CR>", { desc = "Toggle DBUI"} )

-- table/column completion from the connected database, used by 'autocomplete'
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "sql", "mysql", "plsql" },
    callback = function()
        vim.opt_local.complete = "Fvim_dadbod_completion#omni^10,.^5,w^5,b^5,u^5"
    end,
})
