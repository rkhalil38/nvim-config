--[[
return {
    "epwalsh/obsidian.nvim",
    version = "*",  -- recommended, use latest release instead of latest commit
    lazy = true,
    ft = "markdown",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "hrsh7th/nvim-cmp"
    },
    opts = {
        workspaces = {
            {
                -- workspaces here
            },
        },
    },
}
--]]
-- Install plugins
vim.pack.add({
    "https://github.com/epwalsh/obsidian.nvim",
    "https://github.com/nvim-lua/plenary.nvim",
    "https://github.com/hrsh7th/nvim-cmp",
})

--------------------------------------------------
-- Obsidian
--------------------------------------------------
require("obsidian").setup({
    workspaces = {
        {
            -- workspaces here
        },
    },
})
