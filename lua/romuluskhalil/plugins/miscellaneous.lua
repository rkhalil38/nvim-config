vim.pack.add({
    "https://github.com/iamcco/markdown-preview.nvim",
    "https://github.com/nvim-tree/nvim-web-devicons",
    "https://github.com/MeanderingProgrammer/render-markdown.nvim",
    "https://github.com/nvim-treesitter/nvim-treesitter",
    "https://github.com/echasnovski/mini.nvim",
    "https://github.com/nvim-lualine/lualine.nvim",
    "https://github.com/lewis6991/gitsigns.nvim",
    "https://github.com/rcarriga/nvim-notify",
    "https://github.com/folke/noice.nvim",
    "https://github.com/MunifTanjim/nui.nvim",
    "https://github.com/kylechui/nvim-surround",
    "https://github.com/stevearc/oil.nvim",
    "https://github.com/windwp/nvim-autopairs",
    "https://github.com/folke/which-key.nvim",
    "https://github.com/stevearc/conform.nvim",
})

vim.cmd(":packadd nvim.undotree")

--------------------------------------------------
-- markdown-preview.nvim
--------------------------------------------------
local mkdp_path = vim.fn.stdpath("data") .. "/site/pack/core/opt/markdown-preview.nvim"

if vim.fn.isdirectory(mkdp_path) == 1 then
    if vim.fn.executable("npx") == 1 then
        vim.fn.jobstart({
            "bash",
            "-c",
            "cd " .. mkdp_path .. "/app && npx --yes yarn install",
        })
    else
        vim.fn["mkdp#util#install"]()
    end
end

vim.keymap.set("n", "<leader>mp", vim.cmd.MarkdownPreview, { desc = "Markdown Preview (markdown-preview) " })

--------------------------------------------------
-- lualine
--------------------------------------------------
require("lualine").setup({
    options = {
        theme = "auto",
    },
    sections = {
        lualine_c = {
            { "filename", path = 1 },
        },
        lualine_x = {
            "encoding",
            "fileformat",
            function()
                local wc = vim.fn.wordcount()
                if vim.fn.mode() == "v" or vim.fn.mode() == "V" or vim.fn.mode() == "CTRL-V" then
                    return wc["visual_words"] or 0
                else
                    return wc["words"]
                end
            end,
            "filetype",
        },
    },
})

--------------------------------------------------
-- notify
--------------------------------------------------
local notify = require("notify")
notify.setup()
vim.notify = notify

--------------------------------------------------
-- noice
--------------------------------------------------
require("noice").setup({})

--------------------------------------------------
-- nvim-surround
--------------------------------------------------
require("nvim-surround").setup({})

--------------------------------------------------
-- oil
--------------------------------------------------
local oil = require("oil")
oil.setup({
    view_options = {
        show_hidden = true,
        is_hidden_file = function(name, bufnr)
            return name ~= ".." and vim.startswith(name, ".")
        end,
    },
    win_options = {
        winbar = "%{v:lua.require('oil').get_current_dir()}",
    },
})

vim.keymap.set("n", "<leader>pv", oil.open, { desc = "Open cur dir (oil)" })

--------------------------------------------------
-- nvim-autopairs
--------------------------------------------------
require("nvim-autopairs").setup()

--------------------------------------------------
-- which-key
--------------------------------------------------
require("which-key").setup()

--------------------------------------------------
-- conform
--------------------------------------------------
local conform = require("conform")
conform.setup({
    formatters_by_ft = {
        lua = { "stylua" },
        javascript = { "prettier", "npx prettier", stop_after_first = true },
        javascriptreact = { "prettier", "npx prettier", stop_after_first = true },
        typescript = { "prettier", "npx prettier", stop_after_first = true },
        typescriptreact = { "prettier", "npx prettier", stop_after_first = true },
    },
})

vim.keymap.set("n", "<leader>bf", conform.format, { desc = "Format file (conform)" })
