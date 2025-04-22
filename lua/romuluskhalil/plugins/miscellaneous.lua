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
                vim.cmd [[Lazy load markdown-preview.nvim]]
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
                    theme = 'kanagawa'
                }
            }
        end
    }
}
