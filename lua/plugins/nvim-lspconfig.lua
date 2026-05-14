return {
    'neovim/nvim-lspconfig',
    dependencies = {
        'saghen/blink.cmp',
        'williamboman/mason-lspconfig.nvim',
    },
    opts = {
        servers = {
            lua_ls = {
                settings = {
                    Lua = {
                        diagnostics = { globals = { "vim" } },
                    },
                },
            },
            gopls = {},
            rust_analyzer = {},
            ruff = {},
            helm_ls = {},
            terraformls = {},
            tflint = {},
        },
    },
    config = function(_, opts)
        for server, config in pairs(opts.servers) do
            config.capabilities = require('blink.cmp').get_lsp_capabilities(config.capabilities)
            vim.lsp.config[server] = config
        end
        vim.lsp.enable(vim.tbl_keys(opts.servers))
    end,
}
