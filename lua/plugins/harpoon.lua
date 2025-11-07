-- dependencies = { "nvim-lua/plenary.nvim" }
vim.pack.add({
    {
        src = "https://github.com/ThePrimeagen/harpoon",
        version = 'harpoon2'
    },
})

local harpoon = require("harpoon")

harpoon.setup({
    -- menu = {
    --     width = vim.api.nvim_win_get_width(0) - 4,
    -- },
    settings = {
        save_on_toggle = true,
    },
    -- terms = {
    --     select_with_nil = true,
    --     encode = false,
    -- },
})

-- Helper function for numbered navigation (1-5 for simplicity; extend as needed)
local function nav_file(num)
    return function()
        harpoon:list():select(num)
    end
end

local map = vim.keymap.set

-- File marks and navigation
map("n", "<leader>H", function() harpoon:list():add() end, { desc = "Harpoon: add file" })
map("n", "<leader>h", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end,
    { desc = "Harpoon: toggle menu" })

for i = 1, 9 do
    map("n", "<leader>" .. i, nav_file(i), { desc = "Harpoon: goto mark " .. i })
end

-- Cycle through marks
-- map("n", "<leader>n", function() harpoon:list():next() end, { desc = "Harpoon: next mark" })
-- map("n", "<leader>p", function() harpoon:list():prev() end, { desc = "Harpoon: prev mark" })

-- terminals

---@type HarpoonList
local term_list = harpoon:list("terms") -- note the : instead of .

---@param index number: The index of the terminal to select.
local function select_term(index)
    if index > term_list:length() then
        vim.cmd.term()
        print("Creating terminal", index)
        -- just append the newly open terminal
        term_list:add() -- using add() as append() is depricated
    else
        -- find in list
        print("selecting terminal", index)
        term_list:select(index)
    end
end

for i = 1, 4 do
    map("n", "<leader>t" .. i, function() select_term(i) end, { desc = "Harpoon: goto terminal " .. i })
end
