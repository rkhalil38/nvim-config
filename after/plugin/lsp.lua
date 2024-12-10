local lsp_zero = require('lsp-zero')

local lsp_attach = function(client, bufnr)
  lsp_zero.default_keymaps({buffer = bufnr})
end

lsp_zero.extend_lspconfig({
  lsp_attach = lsp_attach,
  sign_text = true,
})

require('mason').setup({})
require('mason-lspconfig').setup({
  -- Replace the language servers listed here
  -- with the ones you want to install
  ensure_installed = {'lua_ls', 'rust_analyzer', 'ts_ls', 'eslint', 'texlab', 'ast_grep', 'jdtls', 'ruff', 'tailwindcss', 'pyright', 'marksman', "clangd"},
  handlers = {
    function(server_name)
      require('lspconfig')[server_name].setup({})
    end,
  }
})

local cmp = require('cmp')
local cmp_format = require('lsp-zero').cmp_format({details = true})
local cmp_action = require('lsp-zero').cmp_action()

cmp.setup({
    sources = {
        {name = 'nvim_lsp'},
        {name = 'buffer'},
        {name = 'rust_analyzer'},
        {name = 'tsserver'},
        {name = 'lua_ls'},
        {name = 'ast_grep'},
        {name = 'jdtls'},
        {name = 'ruff'},
        {name = 'tailwindcss'},
        {name = 'pyright'},
        {name = 'marksman'},
        {name = 'clangd'}
    },
    --- (Optional) Show source name in completion menu
    formatting = cmp_format,
    mapping = cmp.mapping.preset.insert({
        ['<C-p>'] = cmp.mapping.select_prev_item({behavior = 'select'}),
        ['<C-n>'] = cmp.mapping.select_next_item({behavior = 'select'}),

        ['<CR>'] = cmp.mapping.confirm({select = true}),
        ['<C-f>'] = cmp_action.vim_snippet_jump_forward(),
        ['<C-b>'] = cmp_action.vim_snippet_jump_backward(),

        -- Scroll up and down in the completion documentation
        ['<C-u>'] = cmp.mapping.scroll_docs(-4),
        ['<C-d>'] = cmp.mapping.scroll_docs(4),
    }),
    snippet = {
        expand = function(args)
            vim.snippet.expand(args.body)
        end,
    },
})

require('lspconfig').lua_ls.setup({
    on_init = function(client)
        lsp_zero.nvim_lua_settings(client, {})
    end,
})
