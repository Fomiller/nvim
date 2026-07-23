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
                -- Servers with custom settings in lsp-servers.lua are installed
                -- here so a fresh machine reproduces them. Anything else you
                -- :MasonInstall ad hoc is still auto-enabled (below); it just
                -- won't be reinstalled automatically on a new machine.
                ensure_installed = vim.tbl_keys(require("config.lsp-servers")),
                -- Auto-enable every installed server (mason-lspconfig default).
                -- Per-server settings + blink capabilities are layered on in
                -- plugins/nvim-lspconfig.lua.
                automatic_enable = true,
            }
        end,
    },
}
