return {
    {
        'MagicDuck/grug-far.nvim',
        config = function()
            local grug = require("grug-far")

            vim.keymap.set('n', '<leader>fr', grug.open, {})
        end
    },
}
