vim.pack.add({
    { src = "https://github.com/nvim-mini/mini.operators" },
})
require("mini.operators").setup({
    replace = { prefix = "" }, -- Disable automated mappings
})

local operators = require("mini.operators")
operators.setup(opts)

-- Custom mappings mimicking 'replacewithregister'
operators.make_mappings("replace", {
    textobject = "<leader>gr",  -- Replace text object (e.g., `grw` for word)
    line = "<leader>grr",       -- Replace whole line
    selection = "<leader>gr",   -- Replace selection
})
