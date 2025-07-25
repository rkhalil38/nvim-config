return {
    {
        "mason-org/mason-lspconfig.nvim",
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
                "clangd",
                "phpactor",
                "ruby_lsp"
            }
        },
        dependencies = {
            { "mason-org/mason.nvim", opts = {} },
            "neovim/nvim-lspconfig",
        },
    },
    {
        "neovim/nvim-lspconfig",
        config = function ()
            local config_dir = vim.fn.stdpath("config");
            vim.lsp.config('ts_ls', {
                init_options = {
                    plugins = {
                        {
                            name = "@vue/typescript-plugin",
                            location = config_dir .. "/node_modules/@vue/typescript-plugin",
                            languages = {"javascript", "typescript", "vue"},
                        },
                    },
                },
                filetypes = {
                    "javascript",
                    "typescript",
                    "vue",
                },
            })

            vim.lsp.config('ruby_lsp', {
                init_options = {
                    addonSettings = {
                        ["Ruby LSP Rails"] = {
                            enablePendingMigrationsPrompt = false,
                        },
                    },
                },
            })
        end
    }
}
