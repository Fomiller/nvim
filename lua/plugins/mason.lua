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
        "williamboman/mason-lspconfig.nvim",
        opts = function()
            return {
                ensure_installed = vim.tbl_keys(require("config.lsp-servers")),
                -- nvim-lspconfig.lua handles enabling via vim.lsp.enable()
                automatic_enable = false,
            }
        end,
    },
}
