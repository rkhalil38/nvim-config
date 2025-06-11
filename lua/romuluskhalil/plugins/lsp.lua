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
                "phpactor"
            }
        },
        dependencies = {
            { "mason-org/mason.nvim", opts = {} },
            "neovim/nvim-lspconfig",
        },
    }
}
