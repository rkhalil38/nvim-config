--[[
return {
    {
        "ibhagwan/fzf-lua",
        -- optional for icon support
        dependencies = { "nvim-tree/nvim-web-devicons" },
        -- or if using mini.icons/mini.nvim
        -- dependencies = { "echasnovski/mini.icons" },
        config = function ()
            local fzf = require("fzf-lua")

            vim.keymap.set('n', '<leader>ff', fzf.files, {})
            vim.keymap.set('n', '<leader>fs', fzf.live_grep, {})
            vim.keymap.set('n', '<leader>fc', fzf.commands, {})
            vim.keymap.set('n', '<leader>gf', fzf.git_files, {})
            vim.keymap.set('n', '<leader>gb', fzf.git_branches, {})
        end
    }
}
--]]

vim.pack.add({
    "https://github.com/ibhagwan/fzf-lua",
    "https://github.com/nvim-tree/nvim-web-devicons",
    -- or use this instead if you prefer:
    -- "https://github.com/echasnovski/mini.icons",
})

--------------------------------------------------
-- fzf-lua
--------------------------------------------------
local fzf = require("fzf-lua")

vim.keymap.set("n", "<leaderff", fzf.files)
vim.keymap.set("n", "<leaderfs", fzf.live_grep)
vim.keymap.set("n", "<leaderfc", fzf.commands)
vim.keymap.set("n", "<leadergf", fzf.git_files)
vim.keymap.set("n", "<leadergb", fzf.git_branches)
