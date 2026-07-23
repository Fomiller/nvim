-- Single source of truth for LSP servers.
--
-- Servers are auto-enabled by mason-lspconfig (automatic_enable = true in
-- plugins/mason.lua), so `:MasonInstall <server>` + restart is enough to get a
-- server running — no entry here is required just to enable one.
--
-- Add an entry here when you want either:
--   * custom per-server settings, or
--   * the server auto-installed on a fresh machine (ensure_installed is
--     derived from this table's keys).
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
    -- jinja-lsp provides highlighting (via semantic tokens), completion,
    -- hover, and diagnostics for jinja templates. It only attaches to the
    -- `jinja` filetype, which isn't auto-detected for .j2/.jinja2 — see the
    -- vim.filetype.add extension block in plugins/treesitter.lua.
    jinja_lsp     = {},
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
