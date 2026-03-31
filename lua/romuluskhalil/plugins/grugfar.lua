vim.pack.add({
    "https://github.com/MagicDuck/grug-far.nvim",
})

--------------------------------------------------
-- grug-far
--------------------------------------------------
local grug = require("grug-far")

-- configure on vim enter since plugin might not be loaded
vim.api.nvim_create_autocmd('VimEnter', { callback = function ()
    vim.keymap.set("n", "<leader>fr", grug.open)
end })
