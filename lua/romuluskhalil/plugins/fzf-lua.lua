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

vim.keymap.set("n", "<leader>ff", fzf.files, { desc = "Find file (fzf-lua)" })
vim.keymap.set("n", "<leader>fs", fzf.live_grep, { desc = "Find string (fzf-lua)" })
vim.keymap.set("n", "<leader>fc", fzf.commands, { desc = "Find command (fzf-lua)" })
vim.keymap.set("n", "<leader>ft", fzf.colorschemes, { desc = "Find theme (fzf-lua)" })
vim.keymap.set("n", "<leader>gf", fzf.git_files, { desc = "Find git file (fzf-lua)" })
vim.keymap.set("n", "<leader>gb", fzf.git_branches, { desc = "Find git branch (fzf-lua)" })

fzf.setup({
    previewers = {
        builtin = {
            extensions = {
                ["svg"] = { "chafa", "{file}" },
                ["png"] = { "chafa", "{file}" },
                ["jpg"] = { "chafa", "{file}" },
                ["jpeg"] = { "chafa", "{file}" },
            }
        }
    }
})
