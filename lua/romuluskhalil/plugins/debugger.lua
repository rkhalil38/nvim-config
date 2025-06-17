return {
    {
        'mfussenegger/nvim-dap',
        config = function ()
            local dap = require('dap')

            -- php debugger
            dap.adapters.php = {
                type = 'executable',
                command = 'node',
                args = { '~/.config/nvim/vscode-php-debug/out/phpDebug.js' }
            }

            dap.configurations.php = {
                {
                    type = 'php',
                    request = 'launch',
                    name = 'Listen for Xdebug',
                    port = 9003
                }
            }
        end
    }
}
