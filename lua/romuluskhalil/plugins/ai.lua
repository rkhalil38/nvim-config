vim.pack.add({
    "https://github.com/yetone/avante.nvim",
    "https://github.com/nvim-lua/plenary.nvim",
    "https://github.com/MunifTanjim/nui.nvim",
    "https://github.com/HakonHarnes/img-clip.nvim",
    "https://github.com/MeanderingProgrammer/render-markdown.nvim",
    "https://github.com/hrsh7th/nvim-cmp",
    "https://github.com/ibhagwan/fzf-lua",
    "https://github.com/nvim-tree/nvim-web-devicons",
    "https://github.com/zbirenbaum/copilot.lua",
})

-----------------------------------------------
-- avante.nvim
-----------------------------------------------

-- Build
local avante_path = vim.fn.stdpath("data") .. "/site/pack/core/opt/avante.nvim"
if vim.fn.isdirectory(avante_path) == 1 then
    local build_cmd = vim.fn.has("win32") ~= 0
            and "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false"
        or "make"
    vim.fn.jobstart({ "bash", "-c", "cd " .. avante_path .. " && " .. build_cmd })
end

-- Config
require("avante").setup({})
