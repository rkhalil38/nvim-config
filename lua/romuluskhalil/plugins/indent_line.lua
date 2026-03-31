vim.pack.add({
    "https://github.com/lukas-reineke/indent-blankline.nvim",
})

--------------------------------------------------
-- indent-blankline
--------------------------------------------------
local ibl = require("ibl")

ibl.setup({
    indent = {
        char = "▏",
    },
    scope = {
        show_start = false,
        show_end = false,
    },
})
