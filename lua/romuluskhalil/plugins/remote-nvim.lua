--[[
return {
    {
        "amitds1997/remote-nvim.nvim",
        version = "*", -- Pin to GitHub releases
        dependencies = {
            "nvim-lua/plenary.nvim", -- For standard functions
            "MunifTanjim/nui.nvim", -- To build the plugin UI
            "nvim-telescope/telescope.nvim", -- For picking b/w different remote methods
        },
        config = true,
    }
}
--]]
vim.pack.add({
    "https://github.com/amitds1997/remote-nvim.nvim",
    "https://github.com/nvim-lua/plenary.nvim",
    "https://github.com/MunifTanjim/nui.nvim",
    "https://github.com/nvim-telescope/telescope.nvim",
})

--------------------------------------------------
-- remote-nvim
--------------------------------------------------
require("remote-nvim").setup()
