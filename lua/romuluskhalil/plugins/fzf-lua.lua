return {
    {
        "ibhagwan/fzf-lua",
        -- optional for icon support
        dependencies = { "nvim-tree/nvim-web-devicons" },
        -- or if using mini.icons/mini.nvim
        -- dependencies = { "echasnovski/mini.icons" },
        config = function ()
            local fzf = require("fzf-lua")

            vim.keymap.set('n', '<leader>ff', fzf.files, {})
            vim.keymap.set('n', '<leader>fs', fzf.live_grep, {})
            vim.keymap.set('n', '<leader>gf', fzf.git_files, {})
            vim.keymap.set('n', '<leader>gb', fzf.git_branches, {})

        end
    }
}
