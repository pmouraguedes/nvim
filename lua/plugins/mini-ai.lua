vim.pack.add({
	{ src = "https://github.com/nvim-mini/mini.ai" },
})

require("mini.ai").setup({
    custom_textobjects = {
      -- -- Tweak argument textobject
      -- a = require('mini.ai').gen_spec.argument({ brackets = { '%b()' } }),
      --
      -- -- Disable brackets alias in favor of builtin block textobject
      -- b = false,
      --
      -- -- Now `vax` should select `xxx` and `vix` - middle `x`
      -- x = { 'x()x()x' },

      -- Whole buffer
      g = function()
        local from = { line = 1, col = 1 }
        local to = {
          line = vim.fn.line('$'),
          col = math.max(vim.fn.getline('$'):len(), 1)
        }
        return { from = from, to = to }
      end
    }
})
