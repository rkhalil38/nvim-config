return {
    {
        "Exafunction/windsurf.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "hrsh7th/nvim-cmp",
        },
        config = function()
            local codeium = require("codeium")
            codeium.setup({})
            vim.keymap.set("n", "<leader>ai", codeium.chat)
        end
    },
}
