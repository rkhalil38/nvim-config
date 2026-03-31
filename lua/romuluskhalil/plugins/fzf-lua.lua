vim.pack.add({
    "https://github.com/nvim-tree/nvim-web-devicons",
    "https://github.com/ibhagwan/fzf-lua",
    -- or use this instead if you prefer:
    -- "https://github.com/echasnovski/mini.icons",
})

--------------------------------------------------
-- fzf-lua
--------------------------------------------------
local fzf = require("fzf-lua")

-- configure on vim enter since plugin might not be loaded
vim.api.nvim_create_autocmd('VimEnter', { callback = function ()
    vim.keymap.set("n", "<leader>ff", fzf.files)
    vim.keymap.set("n", "<leader>fs", fzf.live_grep)
    vim.keymap.set("n", "<leader>fc", fzf.commands)
    vim.keymap.set("n", "<leader>gf", fzf.git_files)
    vim.keymap.set("n", "<leader>gb", fzf.git_branches)
end })
