return {
    {
        "catppuccin/nvim", name = "catppuccin", priority = 1000,
        opts = function ()
            local catp = require("catppuccin")
            catp.setup({
                flavour = "mocha",
                color_overrides = {
                    mocha = {
                        base = "#000000"
                    }
                }
            })
        end
    },
    {
        "rebelot/kanagawa.nvim",
        opts = function ()
            vim.cmd("colorscheme kanagawa")
        end
    }
}
