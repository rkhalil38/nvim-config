return {
    {
        'mfussenegger/nvim-dap',
        config = function ()
            local dap = require('dap')

            -- php debugger
            dap.adapters.php = {
                type = 'executable',
                command = 'node',
                args = { '/Users/romuluskhalil/.config/nvim/vscode-php-debug/out/phpDebug.js' }
            }
            dap.configurations.php = {
                {
                    type = 'php',
                    request = 'launch',
                    name = 'Listen for Xdebug',
                    port = 9003,
                    pathMappings = {
                        ['/app'] = "${workspaceFolder}"
                    },
                    log = true
                }
            }

            vim.keymap.set("n", "<leader>bp", dap.toggle_breakpoint)
            vim.keymap.set("n", "<leader>dc", dap.continue)
            vim.keymap.set("n", "<leader>so", dap.step_over)
            vim.keymap.set("n", "<leader>si", dap.step_into)
        end
    },
    { "rcarriga/nvim-dap-ui", dependencies = {"mfussenegger/nvim-dap", "nvim-neotest/nvim-nio"} }
}
