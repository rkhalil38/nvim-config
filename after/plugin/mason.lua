require("mason").setup()
require("mason-lspconfig").setup {
    ensure_installed = { "lua_ls", "rust_analyzer", "ts_ls", 'eslint', 'texlab', 'ast_grep', 'jdtls', 'ruff', 'tailwindcss', 'pyright', 'marksman', "clangd"}
}
local lspconfig = require('lspconfig')
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- Rust Setup
lspconfig.rust_analyzer.setup {
  settings = {
    ['rust-analyzer'] = {},
  },
}

-- Lua Setup
require'lspconfig'.lua_ls.setup {
  on_init = function(client)
    if client.workspace_folders then
      local path = client.workspace_folders[1].name
      if path ~= vim.fn.stdpath('config') and (vim.loop.fs_stat(path..'/.luarc.json') or vim.loop.fs_stat(path..'/.luarc.jsonc')) then
        return
      end
    end

    client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
      runtime = {
        -- Tell the language server which version of Lua you're using
        -- (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT'
      },
      -- Make the server aware of Neovim runtime files
      workspace = {
        checkThirdParty = false,
        library = {
          vim.env.VIMRUNTIME
          -- Depending on the usage, you might want to add additional paths here.
          -- "${3rd}/luv/library"
          -- "${3rd}/busted/library",
        }
        -- or pull in all of 'runtimepath'. NOTE: this is a lot slower and will cause issues when working on your own configuration (see https://github.com/neovim/nvim-lspconfig/issues/3189)
        -- library = vim.api.nvim_get_runtime_file("", true)
      }
    })
  end,
  settings = {
    Lua = {}
  },
  capabilities = capabilities
}

-- Typescript Setup
require'lspconfig'.ts_ls.setup{
  init_options = {
    plugins = {
      {
        name = "@vue/typescript-plugin",
        location = "/usr/local/lib/node_modules/@vue/typescript-plugin",
        languages = {"javascript", "typescript", "vue"},
      },
    },
  },
  filetypes = {
    "javascript",
    "typescript",
    "vue",
  },
  capabilities = capabilities,
}

-- Eslint Setup
lspconfig.eslint.setup({
  --- ...
  on_attach = function(client, bufnr)
    vim.api.nvim_create_autocmd("BufWritePre", {
      buffer = bufnr,
      command = "EslintFixAll",
    })
  end,
  capabilities = capabilities
})

-- Texlab Setup
require'lspconfig'.texlab.setup{
    capabilities = capabilities
}

-- Astgrep Setup
require'lspconfig'.ast_grep.setup{
    capabilities = capabilities
}

-- Jdtls Setup
require'lspconfig'.jdtls.setup{
    capabilities = capabilities
}

-- Ruff Setup
require'lspconfig'.ruff.setup{
    capabilities = capabilities
}

-- Tailwind CSS
require'lspconfig'.tailwindcss.setup{
    capabilities = capabilities
}

-- Pyright Setup 
require'lspconfig'.pyright.setup{
    capabilities = capabilities
}

-- Marksman Setup
require'lspconfig'.marksman.setup{
    capabilities = capabilities
}

-- Clangd Setup
require'lspconfig'.clangd.setup{
    capabilities = capabilities
}
