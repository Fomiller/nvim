return {
    {
        "williamboman/mason.nvim",
        opts = {
            ui = {
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗",
                },
            },
        },
    },
    {
        'williamboman/mason-lspconfig.nvim',
        opts = {
            ensure_installed = {
                "lua_ls",
                "rust_analyzer",
                "gopls",
                "ruff",
                "helm_ls",
                "terraformls",
                "tflint",
            },
            -- nvim-lspconfig.lua handles enabling via vim.lsp.enable()
            automatic_enable = false,
        },
    },
}
