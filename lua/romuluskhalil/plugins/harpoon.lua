vim.pack.add({
    "https://github.com/theprimeagen/harpoon",
    "https://github.com/nvim-lua/plenary.nvim",
})

--------------------------------------------------
-- harpoon
--------------------------------------------------
local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "<leader>a", mark.add_file, { desc = "Add file (harpoon)" })
vim.keymap.set("n", "<leader>hp", ui.toggle_quick_menu, { desc = "Open Menu (harpoon)" })

vim.keymap.set("n", "<leader>1", function() ui.nav_file(1) end, { desc = "Nav file 1 (harpoon)" })
vim.keymap.set("n", "<leader>2", function() ui.nav_file(2) end, { desc = "Nav file 2 (harpoon)" })
vim.keymap.set("n", "<leader>3", function() ui.nav_file(3) end, { desc = "Nav file 3 (harpoon)" })
vim.keymap.set("n", "<leader>4", function() ui.nav_file(4) end, { desc = "Nav file 4 (harpoon)" })
