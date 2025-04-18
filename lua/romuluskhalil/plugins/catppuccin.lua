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
            vim.cmd.colorscheme("catppuccin")
        end
    },
}
