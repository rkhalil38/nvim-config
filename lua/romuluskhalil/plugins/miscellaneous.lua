vim.pack.add({
    "https://github.com/akinsho/toggleterm.nvim",
    "https://github.com/iamcco/markdown-preview.nvim",
    "https://github.com/nvim-tree/nvim-web-devicons",
    "https://github.com/MeanderingProgrammer/render-markdown.nvim",
    "https://github.com/nvim-treesitter/nvim-treesitter",
    "https://github.com/echasnovski/mini.nvim",
    "https://github.com/nvim-lualine/lualine.nvim",
    "https://github.com/lewis6991/gitsigns.nvim",
    "https://github.com/rcarriga/nvim-notify",
    "https://github.com/folke/noice.nvim",
    "https://github.com/MunifTanjim/nui.nvim",
})

vim.cmd(":packadd nvim.undotree")

--------------------------------------------------
-- markdown-preview.nvim
--------------------------------------------------
local mkdp_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/markdown-preview.nvim"

if vim.fn.isdirectory(mkdp_path) == 1 then
    if vim.fn.executable("npx") == 1 then
        vim.fn.jobstart({
            "bash",
            "-c",
            "cd " .. mkdp_path .. "/app && npx --yes yarn install",
        })
    else
        vim.fn["mkdp#util#install"]()
    end
end

--------------------------------------------------
-- lualine
--------------------------------------------------
require("lualine").setup({
    options = {
        theme = "auto",
    },
})

--------------------------------------------------
-- notify
--------------------------------------------------
local notify = require("notify")
notify.setup()
vim.notify = notify

--------------------------------------------------
-- noice
--------------------------------------------------
require("noice").setup({})
