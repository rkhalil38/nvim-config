--------------------------------------------------
-- codecompanion
--------------------------------------------------
vim.pack.add({ "https://www.github.com/nvim-lua/plenary.nvim" })
vim.pack.add({ "https://github.com/nvim-treesitter/nvim-treesitter" })
vim.pack.add({ {
  src = "https://www.github.com/olimorris/codecompanion.nvim",
  version = vim.version.range("^19.0.0")
} })

-- claude-agent-acp is installed via this config's package.json, not globally
local acp_bin = vim.fn.stdpath("config") .. "/node_modules/.bin/claude-agent-acp"

require("codecompanion").setup({
    adapters = {
        acp = {
            claude_code = function()
                return require("codecompanion.adapters").extend("claude_code", {
                    commands = {
                        default = { acp_bin },
                        yolo = { acp_bin, "--yolo" },
                    },
                    -- token from `claude setup-token`, read from the environment
                    env = {
                        CLAUDE_CODE_OAUTH_TOKEN = "CLAUDE_CODE_OAUTH_TOKEN",
                    },
                })
            end,
        },
    },
    interactions = {
        chat = {
            adapter = "claude_code",
        },
    }
})

vim.keymap.set({ "n", "v" }, "<leader>cc", "<cmd>CodeCompanionChat Toggle<cr>", { desc = "Toggle chat (codecompanion)" })
vim.keymap.set({ "n", "v" }, "<leader>cp", "<cmd>CodeCompanionActions<cr>", { desc = "Actions (codecompanion)" })
vim.keymap.set("v", "ga", "<cmd>CodeCompanionChat Add<cr>", { desc = "Add selection to chat (codecompanion)" })
