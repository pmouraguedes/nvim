vim.pack.add({
	{ src = "https://github.com/nvim-mini/mini.clue" },
})

local miniclue = require("mini.clue")
miniclue.setup({
	triggers = {
		-- Leader triggers
		{ mode = "n", keys = "<Leader>" },
		{ mode = "x", keys = "<Leader>" },

		-- Built-in completion
		{ mode = "i", keys = "<C-x>" },

		-- `g` key
		{ mode = "n", keys = "g" },
		{ mode = "x", keys = "g" },

		-- `y` key
		{ mode = "n", keys = "y" },
		{ mode = "x", keys = "y" },

		-- `d` key
		{ mode = "n", keys = "d" },
		{ mode = "x", keys = "d" },

		-- `v` key
		{ mode = "n", keys = "v" },
		{ mode = "x", keys = "v" },

		-- `c` key
		{ mode = "n", keys = "c" },
		{ mode = "x", keys = "c" },

		-- Marks
		{ mode = "n", keys = "'" },
		{ mode = "n", keys = "`" },
		{ mode = "x", keys = "'" },
		{ mode = "x", keys = "`" },

		-- Registers
		{ mode = "n", keys = '"' },
		{ mode = "x", keys = '"' },
		{ mode = "i", keys = "<C-r>" },
		{ mode = "c", keys = "<C-r>" },

		-- Window commands
		{ mode = "n", keys = "<C-w>" },

		-- `z` key
		{ mode = "n", keys = "z" },
		{ mode = "x", keys = "z" },
	},

	clues = {
		{ mode = "n", keys = "<Leader>b", desc = "+buffer" },
		{ mode = "n", keys = "<Leader>c", desc = "+code" },
		{ mode = "n", keys = "<Leader>d", desc = "+debug" },
		{ mode = "n", keys = "<Leader>f", desc = "+files/find" },
		{ mode = "n", keys = "<Leader>g", desc = "+git" },
		{ mode = "n", keys = "<Leader>m", desc = "+table mode" },
		{ mode = "n", keys = "<Leader>q", desc = "+quit/session" },
		{ mode = "n", keys = "<Leader>s", desc = "+search" },
		{ mode = "n", keys = "<Leader>t", desc = "+test" },
		{ mode = "n", keys = "<Leader>u", desc = "+ui" },
		{ mode = "n", keys = "<Leader>w", desc = "+windows" },
		{ mode = "n", keys = "<Leader>", desc = "+diagnostics/quickfix" },

		miniclue.gen_clues.builtin_completion(),
		miniclue.gen_clues.g(),
		miniclue.gen_clues.marks(),
		miniclue.gen_clues.registers(),
		miniclue.gen_clues.windows(),
		miniclue.gen_clues.z(),
	},
	window = {
		-- Show window immediately
		delay = 0,

		config = {
			-- Compute window width automatically
			width = "auto",

			-- Use double-line border
			border = "single",
		},
	},
})
