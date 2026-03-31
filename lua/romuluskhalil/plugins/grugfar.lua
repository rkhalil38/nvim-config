vim.pack.add({
    "https://github.com/MagicDuck/grug-far.nvim",
})

--------------------------------------------------
-- grug-far
--------------------------------------------------
local grug = require("grug-far")

vim.keymap.set("n", "<leader>fr", grug.open)
