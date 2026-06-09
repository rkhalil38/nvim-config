vim.pack.add({
    "https://github.com/zbirenbaum/copilot.lua",
    "https://github.com/CopilotC-Nvim/CopilotChat.nvim",
})

-----------------------------------------------
-- copilot.lua
-----------------------------------------------
require("copilot").setup()

-----------------------------------------------
-- CopilotChat.nvim
-----------------------------------------------
require("CopilotChat").setup()
