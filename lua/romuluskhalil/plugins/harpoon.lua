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

for i = 1, 9 do
    vim.keymap.set("n", "<leader>" .. i, function()
        ui.nav_file(i)
    end, { desc = "Nav file " .. i .. " (harpoon)" })
end
