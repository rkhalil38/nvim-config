vim.pack.add({
    "https://github.com/theprimeagen/harpoon",
    "https://github.com/nvim-lua/plenary.nvim",
})

--------------------------------------------------
-- harpoon
--------------------------------------------------
local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

-- configure on vim enter since plugin might not be loaded
vim.api.nvim_create_autocmd('VimEnter', { callback = function ()
    vim.keymap.set("n", "<leader>a", mark.add_file)
    vim.keymap.set("n", "<leader>hp", ui.toggle_quick_menu)

    vim.keymap.set("n", "<leader>1", function() ui.nav_file(1) end)
    vim.keymap.set("n", "<leader>2", function() ui.nav_file(2) end)
    vim.keymap.set("n", "<leader>3", function() ui.nav_file(3) end)
    vim.keymap.set("n", "<leader>4", function() ui.nav_file(4) end)
end })
