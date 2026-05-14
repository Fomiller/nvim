return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "saghen/blink.cmp",
        "williamboman/mason-lspconfig.nvim",
    },
    config = function()
        local servers = require("config.lsp-servers")

        for name, cfg in pairs(servers) do
            cfg.capabilities = require("blink.cmp").get_lsp_capabilities(cfg.capabilities)
            vim.lsp.config[name] = cfg
        end
        vim.lsp.enable(vim.tbl_keys(servers))

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
                vim.keymap.set("n", "gd",         vim.lsp.buf.definition,     opts)
                vim.keymap.set("n", "K", function()
                    vim.lsp.buf.hover({
                        max_width  = 80,
                        max_height = 30,
                        focusable  = true,
                    })
                end, opts)
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
