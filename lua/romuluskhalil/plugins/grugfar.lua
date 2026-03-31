--[[
return {
    {
        'MagicDuck/grug-far.nvim',
        config = function()
            local grug = require("grug-far")

            vim.keymap.set('n', '<leader>fr', grug.open, {})
        end
    },
}
--]]
vim.pack.add({
    "https://github.com/MagicDuck/grug-far.nvim",
})

--------------------------------------------------
-- grug-far
--------------------------------------------------
local grug = require("grug-far")

vim.keymap.set("n", "<leaderfr", grug.open)
