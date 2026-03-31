--[[
return {
    { "akinsho/toggleterm.nvim", version = "*" },
    {
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        ft = { "markdown" },
        build = function (plugin)
            if vim.fn.executable "npx" then
                vim.cmd("!cd " .. plugin.dir .. " && cd app && npx --yes yarn install")
            else
                vim.cmd [[Lazy load markdown-preview.nvim
                vim.fn["mkdp#util#install"]()
            end
        end
    },
    { "nvim-tree/nvim-web-devicons" },
    {
        "MeanderingProgrammer/render-markdown.nvim",
        dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.nvim" }
    },
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        opts =  function ()
            require('lualine').setup {
                options = {
                    theme = 'auto'
                }
            }
        end
    },
    { "lewis6991/gitsigns.nvim" },
    {
        "rcarriga/nvim-notify",
        opts = function ()
            require('notify').setup()
            vim.notify = require('notify')
        end
    },
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        opts = {
            -- add any options here
        },
        dependencies = {
            -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
            "MunifTanjim/nui.nvim",
            -- OPTIONAL:
            --   `nvim-notify` is only needed, if you want to use the notification view.
            --   If not available, we use `mini` as the fallback
            "rcarriga/nvim-notify",
        }
    }
}
--]]
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
