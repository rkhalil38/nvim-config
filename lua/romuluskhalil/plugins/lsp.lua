vim.pack.add({
  "https://github.com/mason-org/mason.nvim",
  "https://github.com/mason-org/mason-lspconfig.nvim",
  "https://github.com/neovim/nvim-lspconfig",
})

--------------------------------------------------
-- init 
--------------------------------------------------

-- enables func ref counts and the like
vim.lsp.codelens.enable(true)

--------------------------------------------------
-- mason
--------------------------------------------------
require("mason").setup()

-- automatically installs and calls vim.lsp.enable
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
    "hyprls"
  },
})

--------------------------------------------------
-- lspconfig
--------------------------------------------------
local config_dir = vim.fn.stdpath("config")

-- IMPORTANT! --
-- Note that nvim-lspconfig provides default configs for all lsps
-- The changes below are merged with those defaults to form final config
-- This means changes below are my own custom tweaks

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

-- Lua LSP setup
vim.lsp.config('lua_ls', {
  on_init = function(client)
    if client.workspace_folders then
      local path = client.workspace_folders[1].name
      if
        path ~= vim.fn.stdpath('config')
        and (vim.uv.fs_stat(path .. '/.luarc.json') or vim.uv.fs_stat(path .. '/.luarc.jsonc'))
      then
        return
      end
    end

    client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
      runtime = {
        -- Tell the language server which version of Lua you're using (most
        -- likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
        -- Tell the language server how to find Lua modules same way as Neovim
        -- (see `:h lua-module-load`)
        path = {
          'lua/?.lua',
          'lua/?/init.lua',
        },
      },
      -- Make the server aware of Neovim runtime files
      workspace = {
        checkThirdParty = false,
        library = {
          vim.env.VIMRUNTIME,
          -- Depending on the usage, you might want to add additional paths
          -- here.
          -- '${3rd}/luv/library',
          -- '${3rd}/busted/library',
        },
        -- Or pull in all of 'runtimepath'.
        -- NOTE: this is a lot slower and will cause issues when working on
        -- your own configuration.
        -- See https://github.com/neovim/nvim-lspconfig/issues/3189
        -- library = vim.api.nvim_get_runtime_file('', true),
      },
    })
  end,
  settings = {
    Lua = {},
  },
})

--------------------------------------------------
-- lsp bindings
--------------------------------------------------
vim.api.nvim_create_autocmd('VimEnter', { callback = function ()
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition)
end })
