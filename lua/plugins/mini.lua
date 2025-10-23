vim.pack.add({
    { src = "https://github.com/nvim-mini/mini.nvim" },
})
--------------------------------------------------------------------------------
require("mini.icons").setup()
require("mini.align").setup()
require('mini.align').setup()
require("mini.pick").setup()
--------------------------------------------------------------------------------
local ai = require("mini.ai")
require("mini.ai").setup({
    custom_textobjects = {
        o = ai.gen_spec.treesitter({ -- code block
            a = { "@block.outer", "@conditional.outer", "@loop.outer" },
            i = { "@block.inner", "@conditional.inner", "@loop.inner" },
        }),
        f = ai.gen_spec.treesitter({ a = "@function.outer", i = "@function.inner" }), -- function
        c = ai.gen_spec.treesitter({ a = "@class.outer", i = "@class.inner" }), -- class
        t = { "<([%p%w]-)%f[^<%w][^<>]->.-</%1>", "^<.->().*()</[^/]->$" }, -- tags
        d = { "%f[%d]%d+" }, -- digits
        e = { -- Word with case
            { "%u[%l%d]+%f[^%l%d]", "%f[%S][%l%d]+%f[^%l%d]", "%f[%P][%l%d]+%f[^%l%d]", "^[%l%d]+%f[^%l%d]" },
            "^().*()$",
        },
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
--------------------------------------------------------------------------------
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

        -- `[` and `]` keys
        { mode = "n", keys = "[" },
        { mode = "n", keys = "]" },

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
        { mode = "n", keys = "<Leader>",  desc = "+diagnostics/quickfix" },

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
--------------------------------------------------------------------------------
require("mini.operators").setup({
    -- Each entry configures one operator.
    -- `prefix` defines keys mapped during `setup()`: in Normal mode
    -- to operate on textobject and line, in Visual - on selection.

    -- Evaluate text and replace with output
    evaluate = {
        prefix = '<leader>g=',

        -- Function which does the evaluation
        func = nil,
    },

    -- Exchange text regions
    exchange = {
        -- NOTE: Default `gx` is remapped to `gX`
        prefix = '<leader>gx',

        -- Whether to reindent new text to match previous indent
        reindent_linewise = true,
    },

    -- Multiply (duplicate) text
    multiply = {
        prefix = '<leader>gm',

        -- Function which can modify text before multiplying
        func = nil,
    },

    -- Replace text with register
    replace = {
        -- NOTE: Default `gr*` LSP mappings are removed
        prefix = '<leader>gr',

        -- Whether to reindent new text to match previous indent
        reindent_linewise = true,
    },

    -- Sort text
    sort = {
        prefix = '<leader>gs',

        -- Function which does the sort
        func = nil,
    }
})
--------------------------------------------------------------------------------
require("mini.surround").setup({
    mappings = {
        add = 'gsa',            -- Add surrounding in Normal and Visual modes
        delete = 'gsd',         -- Delete surrounding
        find = 'gsf',           -- Find surrounding (to the right)
        find_left = 'gsF',      -- Find surrounding (to the left)
        highlight = 'gsh',      -- Highlight surrounding
        replace = 'gsr',        -- Replace surrounding
        update_n_lines = "gsn", -- Update `n_lines`
    },
})
--------------------------------------------------------------------------------
