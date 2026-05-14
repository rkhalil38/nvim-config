-- Leave Normal Command
vim.keymap.set("i", "jj", "<Esc>", { desc = "Leave normal mode" })

-- Instant Command Fill
vim.keymap.set(
    "n",
    "<leader>cm",
    ':call feedkeys(":! ")<CR>',
    { noremap = true, silent = true, desc = "Instant command" }
)

-- Quit Remap
vim.keymap.set("n", "<leader>q", vim.cmd.quit, { desc = "Quit" })

-- Write Remap
vim.keymap.set("n", "<leader>w", vim.cmd.write, { desc = "Write" })
