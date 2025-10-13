require('config.globals')
require('config.options')
require('config.keymap')
require('config.autocmd')
require('config.lsp')

vim.pack.add({
	{ src = "https://github.com/vhyrro/luarocks.nvim" },
	{ src = "https://github.com/pmouraguedes/neodarcula.nvim" },
})

-- LuaRocks (needed for image plugin)
-- this plugin needs to run before anything else
-- cd /home/pguedes/.local/share/nvim4/site/pack/core/opt/luarocks.nvim
-- nvim -l build.lua
require("luarocks-nvim").setup({
    rocks = { "magick" },
})

-- Color theme
require("neodarcula").setup({
	transparent = false,
	dim = true,
})
vim.cmd([[colorscheme neodarcula]])

-- Dinamically load other plugins
local plugins_dir = vim.fn.stdpath("config") .. "/lua/plugins"
local plugin_files = vim.fn.glob(plugins_dir .. "/*.lua", false, true)

for _, file in ipairs(plugin_files) do
    local name = vim.fn.fnamemodify(file, ":t:r") -- filename without .lua
    local ok, spec = pcall(require, "plugins." .. name)
end

