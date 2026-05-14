-- Single source of truth for LSP servers.
--
-- To add a server:
--   1) Append a `<server_name> = { ...opts... }` entry below.
--   2) Restart nvim. mason-lspconfig will install it, nvim-lspconfig will enable it.
--
-- Per-server settings go in the value table.
-- An empty table `{}` means "use defaults".
return {
    lua_ls = {
        settings = {
            Lua = { diagnostics = { globals = { "vim" } } },
        },
    },

    gopls = {
        settings = {
            gopls = {
                analyses = {
                    unusedparams = true,
                    unusedwrite  = true,
                    shadow       = true,
                    nilness      = true,
                    useany       = true,
                },
                staticcheck = true,
                hints = {
                    assignVariableTypes    = true,
                    compositeLiteralFields = true,
                    constantValues         = true,
                    parameterNames         = true,
                    rangeVariableTypes     = true,
                },
            },
        },
    },

    rust_analyzer = {
        settings = {
            ["rust-analyzer"] = {
                check = {
                    command = "clippy", -- clippy on save instead of cargo check
                },
                cargo = {
                    allFeatures = true,
                },
                inlayHints = {
                    bindingModeHints = { enable = true },
                    closureReturnTypeHints = { enable = "always" },
                },
            },
        },
    },

    ruff          = {},
    helm_ls       = {},
    terraformls   = {},
    tflint        = {},
}
