vim.g.mapleader = " "

-- Pull Up Explore
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Swap Windows
vim.keymap.set("n", "<leader>sw", "<C-w>")

-- Split Window 
vim.keymap.set("n", "<leader>sp", vim.cmd.vsplit)

-- Leave Normal Command
vim.keymap.set("i", "jj", "<Esc>")

-- Instant Command Fill
vim.keymap.set("n", "<leader>cm", ':call feedkeys(":! ")<CR>', { noremap = true, silent = true})

-- Terminal Toggle using toggleterm
vim.keymap.set("n", "<leader>te", vim.cmd.ToggleTerm);

-- Leave Terminal Mode 
vim.keymap.set("t", "<leader>lt", "<C-\\><C-n><C-w>h<C-w>k",{silent = true});

-- Quit Remap
vim.keymap.set("n", "<leader>q", vim.cmd.quit)

-- Write Remap
vim.keymap.set("n", "<leader>w", vim.cmd.write)

-- Undo Remap
vim.keymap.set("n", "U", vim.cmd.undo)

-- Markdown Preview
vim.keymap.set("n", "<leader>mp", vim.cmd.MarkdownPreview)
