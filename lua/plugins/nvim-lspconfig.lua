return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "saghen/blink.cmp",
        "williamboman/mason-lspconfig.nvim",
    },
    config = function()
        -- blink.cmp completion capabilities for EVERY server, including ones
        -- auto-enabled by mason-lspconfig that aren't listed in lsp-servers.lua.
        -- vim.lsp.config merges this "*" default into each resolved server.
        vim.lsp.config("*", {
            capabilities = require("blink.cmp").get_lsp_capabilities(),
        })

        -- Layer on per-server settings from lsp-servers.lua. Enabling itself is
        -- handled by mason-lspconfig (automatic_enable = true in mason.lua).
        for name, cfg in pairs(require("config.lsp-servers")) do
            vim.lsp.config[name] = cfg
        end

        -- Filetypes where inlay hints are ON by default.
        -- Add/remove freely. Toggle per-buffer at any time with <leader>ih.
        local inlay_hints_default_on = {
            go   = true,
            rust = true,
        }

        -- Keymaps + inlay-hint defaults run on every LSP attach.
        vim.api.nvim_create_autocmd("LspAttach", {
            callback = function(e)
                local opts = { buffer = e.buf }

                -- terraform-ls emits enormous textDocument/semanticTokens/full
                -- responses for dense files (e.g. IAM modules). Neovim decodes
                -- and applies them synchronously on the main loop, which freezes
                -- the whole instance. Treesitter already highlights .tf files, so
                -- disable LSP semantic tokens for this server.
                local client = vim.lsp.get_client_by_id(e.data.client_id)
                if client and client.name == "terraformls" then
                    client.server_capabilities.semanticTokensProvider = nil
                end
                vim.keymap.set("n", "gd",         vim.lsp.buf.definition,     opts)
                vim.keymap.set("n", "K",          vim.lsp.buf.hover,          opts)
                vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float,  opts)
                vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action,    opts)
                vim.keymap.set("n", "<leader>rr", vim.lsp.buf.references,     opts)
                vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename,         opts)
                vim.keymap.set("i", "<C-h>",      vim.lsp.buf.signature_help, opts)

                -- Toggle inlay hints for the current buffer.
                vim.keymap.set("n", "<leader>ih", function()
                    local enabled = vim.lsp.inlay_hint.is_enabled({ bufnr = e.buf })
                    vim.lsp.inlay_hint.enable(not enabled, { bufnr = e.buf })
                end, vim.tbl_extend("force", opts, { desc = "Toggle inlay hints" }))

                if inlay_hints_default_on[vim.bo[e.buf].filetype] then
                    vim.lsp.inlay_hint.enable(true, { bufnr = e.buf })
                end
            end,
        })
    end,
}
