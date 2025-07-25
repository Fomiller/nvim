return  {
    'VonHeikemen/lsp-zero.nvim',
    dependencies = {
        -- LSP Support
        { 'neovim/nvim-lspconfig' },
        { 'williamboman/mason.nvim' },
        { 'williamboman/mason-lspconfig.nvim' },
        -- Autocompletion
        { 'saadparwaiz1/cmp_luasnip' },
        { 'hrsh7th/cmp-buffer' },
        { 'hrsh7th/cmp-path' },
        { 'hrsh7th/cmp-nvim-lsp' },
        { 'hrsh7th/cmp-nvim-lua' },
        { 'hrsh7th/nvim-cmp' },
        -- Snippets
        { 'L3MON4D3/LuaSnip' },
        { 'rafamadriz/friendly-snippets' },
        -- Format
        { 'stevearc/conform.nvim' },
    },
    opts = {}

    --     local lsp = require('lsp-zero')
    --     lsp.preset('recommended')
    --     -- lsp.nvim_workspace({
        --     --     settings = {
            --     --         Lua = {
                --     --             diagnostics = {
                    --     --                 globals = { 'vim' }
                    --     --             }
                    --     --         }
                    --     --     }
                    --     -- })
                    --
                    --     lsp.ensure_installed({
                        --         'gopls',
                        --         'rust_analyzer',
                        --         'yamlls',
                        --         'terraformls',
                        --         'tflint',
                        --         'bashls',
                        --         'dockerls',
                        --         'html',
                        --         'jsonls',
                        --     })
                        --     lsp.setup()
                    }

-- set filetypes
-- vim.cmd([[autocmd BufRead, BufNewFile JenkinsFile set filetype=groovy]])
-- vim.cmd([[autocmd BufRead, BufNewFile justfile set filetype=make]])

-- vim.cmd([[silent! autocmd! filetypedetect BufRead,BufNewFile *.tf]])
-- vim.cmd([[autocmd BufRead,BufNewFile *.hcl set filetype=hcl]])
-- vim.cmd([[autocmd BufRead,BufNewFile .terraformrc,terraform.rc set filetype=hcl]])
-- vim.cmd([[autocmd BufRead,BufNewFile *.tf,*.tfvars set filetype=terraform]])
-- vim.cmd([[autocmd BufRead,BufNewFile *.tfstate,*.tfstate.backup set filetype=json]])
-- vim.cmd([[let g:terraform_fmt_on_save=1]])
-- vim.cmd([[let g:terraform_align=1]])

-- THEPRIMEAGENS LSP SETUP

-- lsp.preset("recommended")
--
-- lsp.ensure_installed({
--   'tsserver',
--   'gopls',
--   'eslint',
--   'sumneko_lua',
--   'rust_analyzer',
-- })
--
-- local cmp = require('cmp')
-- local cmp_select = {behavior = cmp.SelectBehavior.Select}
-- local cmp_mappings = lsp.defaults.cmp_mappings({
--
--   ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
--   ['<C-y>'] = cmp.mapping.confirm({ select = true }),
--   ["<C-Space>"] = cmp.mapping.complete(),
-- })
--
-- -- disable completion with tab
-- -- this helps with copilot setup
-- cmp_mappings['<Tab>'] = nil
-- cmp_mappings['<S-Tab>'] = nil
--
-- lsp.setup_nvim_cmp({
--   mapping = cmp_mappings
-- })
--
-- lsp.set_preferences({
--     suggest_lsp_servers = false,
--     sign_icons = {
--     error = '✘',
--     warn = '▲',
--     hint = '⚑',
--     info = ''    }
-- })
--
-- lsp.on_attach(function(client, bufnr)
--   local opts = {buffer = bufnr, remap = false}
--
--   if client.name == "eslint" then
--       vim.cmd.LspStop('eslint')
--       return
--   end
--
--   vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
--   vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
--   vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, opts)
--   vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, opts)
--   vim.keymap.set("n", "[d", vim.diagnostic.goto_next, opts)
--   vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, opts)
--   vim.keymap.set("n", "<leader>vca", vim.lsp.buf.code_action, opts)
--   vim.keymap.set("n", "<leader>vrr", vim.lsp.buf.references, opts)
--   vim.keymap.set("n", "<leader>vrn", vim.lsp.buf.rename, opts)
--   vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)
-- end)
--
-- Lua = require('lspconfig').sumneko_lua
-- Lua.setup {
--   settings = {
--     Lua = {
--       diagnostics = {
--         -- Get the language server to recognize the `vim` global
--         globals = {'vim'},
--       },
--     },
--   },
-- }
--
-- lsp.setup()
--
-- vim.diagnostic.config({
--     virtual_text = true,
-- })

