vim.pack.add({
    { src = "https://github.com/nvim-treesitter/nvim-treesitter",             version = "main" },
    { src = "https://github.com/nvim-treesitter/nvim-treesitter-textobjects", version = "main" },
    { src = "https://github.com/nvim-treesitter/nvim-treesitter-context" },
})

-- nvim-treesitter (main) only installs parsers and queries; highlighting, folds and
-- incremental selection are built into neovim and enabled per buffer below
local ts = require("nvim-treesitter")
ts.install({ "lua" })

local available = {}
for _, lang in ipairs(ts.get_available()) do
    available[lang] = true
end

local function enable(buf, lang)
    if not pcall(vim.treesitter.start, buf, lang) then
        return
    end
    -- treesitter indent is still provided by nvim-treesitter (experimental)
    vim.bo[buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
end

vim.api.nvim_create_autocmd("FileType", {
    desc = "Start treesitter, installing the parser if missing",
    group = vim.api.nvim_create_augroup("treesitter-start", { clear = true }),
    callback = function(ev)
        local lang = vim.treesitter.language.get_lang(ev.match) or ev.match
        if vim.treesitter.language.add(lang) then
            enable(ev.buf, lang)
        elseif available[lang] then
            -- replaces auto_install from the old master branch
            ts.install({ lang }):await(vim.schedule_wrap(function()
                if vim.api.nvim_buf_is_valid(ev.buf) then
                    enable(ev.buf, lang)
                end
            end))
        end
    end,
})

vim.api.nvim_create_autocmd("PackChanged", {
    desc = "Update parsers when nvim-treesitter is updated",
    group = vim.api.nvim_create_augroup("nvim-treesitter-pack-changed-update-handler", { clear = true }),
    callback = function(event)
        if event.data.kind == "update" and event.data.spec.name == "nvim-treesitter" then
            vim.notify("nvim-treesitter updated, running TSUpdate...", vim.log.levels.INFO)
            ---@diagnostic disable-next-line: param-type-mismatch
            local ok = pcall(vim.cmd, "TSUpdate")
            if not ok then
                vim.notify("TSUpdate command not available yet, skipping", vim.log.levels.WARN)
            end
        end
    end,
})

-- textobjects (af/if, ao/io, ...) come from mini.ai; this plugin is only used for swapping
local swap = require("nvim-treesitter-textobjects.swap")

vim.keymap.set("n", "<leader>a", function()
    swap.swap_next("@parameter.inner")
end, { desc = "Swap with next parameter" })
vim.keymap.set("n", "<leader>A", function()
    swap.swap_previous("@parameter.inner")
end, { desc = "Swap with previous parameter" })

require("treesitter-context").setup({
    enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
    -- multiwindow = false,    -- Enable multiwindow support.
    -- max_lines = 0,          -- How many lines the window should span. Values <= 0 mean no limit.
    -- min_window_height = 0,  -- Minimum editor window height to enable context. Values <= 0 mean no limit.
    -- line_numbers = true,
    -- multiline_threshold = 20, -- Maximum number of lines to show for a single context
    -- trim_scope = 'outer',   -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
    -- mode = 'cursor',        -- Line used to calculate context. Choices: 'cursor', 'topline'
    -- -- Separator between context and content. Should be a single character string, like '-'.
    -- -- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
    -- separator = nil,
    -- zindex = 20,   -- The Z-index of the context window
    -- on_attach = nil, -- (fun(buf: integer): boolean) return false to disable attaching
})

vim.keymap.set("n", "[c", function()
    require("treesitter-context").go_to_context(vim.v.count1)
end, { desc = "Go to parent context", silent = true })
