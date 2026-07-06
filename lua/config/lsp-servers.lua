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
    terraformls   = {
        -- terraform-ls logs every JSON-RPC request/response (incl. full
        -- semantic-token payloads) to stderr, which nvim captures into
        -- lsp.log at ERROR level regardless of vim.lsp.log level. That can
        -- balloon lsp.log to multiple GB. Discard its stderr at the source.
        cmd = { "sh", "-c", "exec terraform-ls serve 2>/dev/null" },
        -- This repo is a ~9GB terragrunt monorepo: each .terragrunt-cache
        -- holds a ~700MB .terraform provider-schema dir plus copied source.
        -- Without this, terraform-ls indexes the whole tree on attach and
        -- freezes nvim. Skip the generated cache/stack dirs (they're not
        -- hand-edited) so it only indexes real source modules.
        init_options = {
            indexing = {
                ignoreDirectoryNames = { ".terragrunt-cache", ".terragrunt-stack" },
            },
        },
    },
    tflint        = {},
}
