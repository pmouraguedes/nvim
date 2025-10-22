vim.pack.add({
    { src = "https://github.com/folke/snacks.nvim" },
})

local snacks = require("snacks")

snacks.setup({
    bufdelete = {
        picker = {
            formatters = {
                file = {
                    filename_first = true, -- display filename before the file path
                    truncate = 160,        -- truncate the file path to (roughly) this length
                    filename_only = false, -- only show the filename
                    icon_width = 2,        -- width of the icon (in characters)
                    git_status_hl = true,  -- use the git status highlight group for the filename
                },
            },
            layout = {
                preset = "vertical",
            },
        },
        explorer = {},
    },
})

local map = vim.keymap.set

map("n", "<leader>bd", function() snacks.bufdelete() end, { desc = "Delete Buffer" })
map("n", "<leader>bo", function() snacks.bufdelete.other() end, { desc = "Delete Other Buffers" })

-- Top Pickers & Explorer
map("n", "<leader><space>", function() snacks.picker.smart() end, { desc = "Smart Find Files" })
map("n", "<leader>,", function() snacks.picker.buffers() end, { desc = "Buffers" })
map("n", "<leader>/", function() snacks.picker.grep() end, { desc = "Grep" })
map("n", "<leader>:", function() snacks.picker.command_history() end, { desc = "Command History" })
map("n", "<leader>n", function() snacks.picker.notifications() end, { desc = "Notification History" })
map("n", "<leader>e", function() snacks.explorer() end, { desc = "File Explorer" })
-- find
map("n", "<leader>fb", function() snacks.picker.buffers() end, { desc = "Buffers" })
map("n", "<leader>fc", function() snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end,
    { desc = "Find Config File" })
map("n", "<leader>ff", function() snacks.picker.files() end, { desc = "Find Files" })
map("n", "<leader>fg", function() snacks.picker.git_files() end, { desc = "Find Git Files" })
map("n", "<leader>fp", function() snacks.picker.projects() end, { desc = "Projects" })
map("n", "<leader>fr", function() snacks.picker.recent() end, { desc = "Recent" })
-- git
map("n", "<leader>gb", function() snacks.picker.git_branches() end, { desc = "Git Branches" })
map("n", "<leader>gl", function() snacks.picker.git_log() end, { desc = "Git Log" })
map("n", "<leader>gL", function() snacks.picker.git_log_line() end, { desc = "Git Log Line" })
map("n", "<leader>gs", function() snacks.picker.git_status() end, { desc = "Git Status" })
map("n", "<leader>gS", function() snacks.picker.git_stash() end, { desc = "Git Stash" })
map("n", "<leader>gd", function() snacks.picker.git_diff() end, { desc = "Git Diff (Hunks)" })
map("n", "<leader>gf", function() snacks.picker.git_log_file() end, { desc = "Git Log File" })
-- Grep
map("n", "<leader>sb", function() snacks.picker.lines() end, { desc = "Buffer Lines" })
map("n", "<leader>sB", function() snacks.picker.grep_buffers() end, { desc = "Grep Open Buffers" })
map("n", "<leader>sg", function() snacks.picker.grep() end, { desc = "Grep" })
map({ "n", "x" }, "<leader>sw", function() snacks.picker.grep_word() end, { desc = "Visual selection or word" })
map({ "n", "x" }, "<leader>sW", function() snacks.picker.grep_word({ root = false }) end,
    { desc = "Visual selection or word" })
-- search
map("n", '<leader>s"', function() snacks.picker.registers() end, { desc = "Registers" })
map("n", "<leader>s/", function() snacks.picker.search_history() end, { desc = "Search History" })
map("n", "<leader>sa", function() snacks.picker.autocmds() end, { desc = "Autocmds" })
map("n", "<leader>sb", function() snacks.picker.lines() end, { desc = "Buffer Lines" })
map("n", "<leader>sc", function() snacks.picker.command_history() end, { desc = "Command History" })
map("n", "<leader>sC", function() snacks.picker.commands() end, { desc = "Commands" })
map("n", "<leader>sd", function() snacks.picker.diagnostics() end, { desc = "Diagnostics" })
map("n", "<leader>sD", function() snacks.picker.diagnostics_buffer() end, { desc = "Buffer Diagnostics" })
map("n", "<leader>sh", function() snacks.picker.help() end, { desc = "Help Pages" })
map("n", "<leader>sH", function() snacks.picker.highlights() end, { desc = "Highlights" })
map("n", "<leader>si", function() snacks.picker.icons() end, { desc = "Icons" })
map("n", "<leader>sj", function() snacks.picker.jumps() end, { desc = "Jumps" })
map("n", "<leader>sk", function() snacks.picker.keymaps() end, { desc = "Keymaps" })
map("n", "<leader>sl", function() snacks.picker.loclist() end, { desc = "Location List" })
map("n", "<leader>sm", function() snacks.picker.marks() end, { desc = "Marks" })
map("n", "<leader>sM", function() snacks.picker.man() end, { desc = "Man Pages" })
map("n", "<leader>sp", function() snacks.picker.lazy() end, { desc = "Search for Plugin Spec" })
map("n", "<leader>sq", function() snacks.picker.qflist() end, { desc = "Quickfix List" })
map("n", "<leader>sR", function() snacks.picker.resume() end, { desc = "Resume" })
map("n", "<leader>su", function() snacks.picker.undo() end, { desc = "Undo History" })
map("n", "<leader>uC", function() snacks.picker.colorschemes() end, { desc = "Colorschemes" })
-- LSP
map("n", "gd", function() snacks.picker.lsp_definitions() end, { desc = "Goto Definition" })
map("n", "gD", function() snacks.picker.lsp_declarations() end, { desc = "Goto Declaration" })
map("n", "gr", function() snacks.picker.lsp_references() end, { nowait = true, desc = "References" })
map("n", "gI", function() snacks.picker.lsp_implementations() end, { desc = "Goto Implementation" })
map("n", "gy", function() snacks.picker.lsp_type_definitions() end, { desc = "Goto T[y]pe Definition" })
map("n", "<leader>ss", function() snacks.picker.lsp_symbols() end, { desc = "LSP Symbols" })
map("n", "<leader>sS", function() snacks.picker.lsp_workspace_symbols() end, { desc = "LSP Workspace Symbols" })
