vim.pack.add({
  "https://github.com/mason-org/mason.nvim",
  "https://github.com/mason-org/mason-lspconfig.nvim",
  "https://github.com/neovim/nvim-lspconfig",
})

--------------------------------------------------
-- mason
--------------------------------------------------
require("mason").setup()

require("mason-lspconfig").setup({
  ensure_installed = {
    "lua_ls",
    "rust_analyzer",
    "ts_ls",
    "eslint",
    "texlab",
    "ast_grep",
    "jdtls",
    "tailwindcss",
    "pyright",
    "marksman",
    "clangd",
    "phpactor",
    "ruby_lsp",
  },
})

--------------------------------------------------
-- lspconfig
--------------------------------------------------
local config_dir = vim.fn.stdpath("config")

-- TypeScript / Vue setup
vim.lsp.config("ts_ls", {
  init_options = {
    plugins = {
      {
        name = "@vue/typescript-plugin",
        location = config_dir .. "/node_modules/@vue/typescript-plugin",
        languages = { "javascript", "typescript", "vue" },
      },
    },
  },
  filetypes = {
    "javascript",
    "typescript",
    "vue",
  },
})

-- Ruby LSP setup
vim.lsp.config("ruby_lsp", {
  init_options = {
    addonSettings = {
      ["Ruby LSP Rails"] = {
        enablePendingMigrationsPrompt = false,
      },
    },
  },
})
