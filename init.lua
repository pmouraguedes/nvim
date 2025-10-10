require('config.globals')
require('config.options')
require('config.keymap')
require('config.autocmd')
require('config.lsp')

local plugins_dir = vim.fn.stdpath("config") .. "/lua/plugins"
local plugin_files = vim.fn.glob(plugins_dir .. "/*.lua", false, true)

for _, file in ipairs(plugin_files) do
    local name = vim.fn.fnamemodify(file, ":t:r") -- filename without .lua
    local ok, spec = pcall(require, "plugins." .. name)
end

