vim.pack.add({
    "https://github.com/folke/trouble.nvim",
})

--------------------------------------------------
-- trouble
--------------------------------------------------
require("trouble").setup({})

vim.keymap.set("n", "<leaderxx>", "<cmd>Trouble diagnostics toggle<cr>", { desc = "Diagnostics (Trouble)" })
vim.keymap.set("n", "<leaderxX>", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", { desc = "Buffer Diagnostics (Trouble)" })
vim.keymap.set("n", "<leadersc>", "<cmd>Trouble symbols toggle focus=false<cr>", { desc = "Symbols (Trouble)" })
vim.keymap.set("n", "<leadercl>", "<cmd>Trouble lsp toggle focus=false win.position=right<cr>", { desc = "LSP Definitions / references / ... (Trouble)" })
vim.keymap.set("n", "<leaderxL>", "<cmd>Trouble loclist toggle<cr>", { desc = "Location List (Trouble)" })
vim.keymap.set("n", "<leaderxQ>", "<cmd>Trouble qflist toggle<cr>", { desc = "Quickfix List (Trouble)" })
