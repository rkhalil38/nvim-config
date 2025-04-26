return {
    {
        "williamboman/mason.nvim",
        opts = {
            ensure_installed = {
                "lua_ls",
                "rust_analyzer",
                "ts_ls",
                'eslint',
                'texlab',
                'ast_grep',
                'jdtls',
                'tailwindcss',
                'pyright',
                'marksman',
                "clangd"
            }
        }
    },
    { "williamboman/mason-lspconfig.nvim" },
    {
        dependencies = {
            {
                "folke/neoconf.nvim",
                cmd = "Neoconf",
                config = function()
                    local lspconfig = require("lspconfig")
                    local mason_lspconfig = require("mason-lspconfig")
                    local cmp_nvim_lsp = require("cmp_nvim_lsp")
                    local capabilities = cmp_nvim_lsp.default_capabilities()

                    mason_lspconfig.setup_handlers({
                        function(server_name)
                            lspconfig[server_name].setup({
                                capabilities = capabilities,
                            })
                        end
                    })
                end
            },
        },
        "neovim/nvim-lspconfig",
    }
}
