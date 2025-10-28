-- dependencies
-- "nvim-neotest/nvim-nio",
-- "nvim-lua/plenary.nvim",
-- "antoinemadec/FixCursorHold.nvim",
-- "nvim-treesitter/nvim-treesitter"

vim.pack.add({
    { src = "https://github.com/nvim-neotest/neotest" },
    { src = "https://github.com/fredrikaverpil/neotest-golang" },
})

require("neotest").setup({
    adapters = {
        -- treesitter has to be loaded first
        require("neotest-golang")({
            -- go install gotest.tools/gotestsum@latest
            runner = "gotestsum", -- Optional, but recommended
        }),
        require('rustaceanvim.neotest'),
    },
})

local map = vim.keymap.set

map("n", "<leader>ta", function() require("neotest").run.attach() end, { desc = "Attach to Test (Neotest)" })
map("n", "<leader>tt", function() require("neotest").run.run(vim.fn.expand("%")) end, { desc = "Run File (Neotest)" })
map("n", "<leader>tT", function() require("neotest").run.run(vim.uv.cwd()) end, { desc = "Run All Test Files (Neotest)" })
map("n", "<leader>tr", function() require("neotest").run.run() end, { desc = "Run Nearest (Neotest)" })
map("n", "<leader>tl", function() require("neotest").run.run_last() end, { desc = "Run Last (Neotest)" })
map("n", "<leader>ts", function() require("neotest").summary.toggle() end, { desc = "Toggle Summary (Neotest)" })
map("n", "<leader>to", function() require("neotest").output.open({ enter = true, auto_close = true }) end,
    { desc = "Show Output (Neotest)" })
map("n", "<leader>tO", function() require("neotest").output_panel.toggle() end,
    { desc = "Toggle Output Panel (Neotest)" })
map("n", "<leader>tS", function() require("neotest").run.stop() end, { desc = "Stop (Neotest)" })
map("n", "<leader>tw", function() require("neotest").watch.toggle(vim.fn.expand("%")) end,
    { desc = "Toggle Watch (Neotest)" })
