vim.pack.add({
  "https://github.com/mfussenegger/nvim-dap",
  "https://github.com/rcarriga/nvim-dap-ui",
  "https://github.com/nvim-neotest/nvim-nio"
})

-----------------------------------------------
-- nvim-dap 
-----------------------------------------------
local dap = require('dap')
local config_dir = vim.fn.stdpath("config");

-- configure on vim enter since plugin might not be loaded
vim.api.nvim_create_autocmd('VimEnter', { callback = function ()
    -- php debugger
    dap.adapters.php = {
        type = 'executable',
        command = 'node',
        args = { config_dir .. '/vscode-php-debug/out/phpDebug.js' }
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
end })

-----------------------------------------------
-- nvim-dap-ui 
-----------------------------------------------
local dapui = require("dapui")
dapui.setup()

-- configure on vim enter since plugin might not be loaded
vim.api.nvim_create_autocmd('VimEnter', { callback = function ()
    vim.keymap.set("n", "<leader>dv", dapui.toggle)
end })
