return {
    {
        "williamboman/mason.nvim",
        opts = {
            ui = {
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗"
                }
            }
        }
    },
    {
        'williamboman/mason-lspconfig.nvim',
        opts = {
            handlers = {
                function(server_name)
                    require('lspconfig')[server_name].setup({})
                end,
            },
            ensure_installed = {
                "lua_ls",
                "rust_analyzer",
                "gopls",
                "ruff",
            }
        }
    }
}
