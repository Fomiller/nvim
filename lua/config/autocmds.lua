local autocmd = vim.api.nvim_create_autocmd

-- format before saving
autocmd('BufWritePre', {
    pattern = { '*' },
    callback = function(args)
        require("conform").format({bufnr = args.buf})
    end,
})


-- setup comment strings for terraform files
autocmd("FileType", {
    pattern = { "hcl", "terraform" },
    desc = "terraform/hcl commentstring configuration",
    callback = function()
        vim.opt_local.commentstring = "# %s"
        vim.opt_local.tabstop = 2
        vim.opt_local.shiftwidth = 2
        vim.opt_local.softtabstop = 2
        vim.opt_local.expandtab = true
    end
})

-- setup keys bindings when lsp attaches
autocmd('LspAttach', {
    callback = function(e)
        local opts = { buffer = e.buf }
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, opts)
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
        vim.keymap.set("n", "<leader>rr", vim.lsp.buf.references, opts)
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
        vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)
    end
})

-- Prevent automatic comment continuation when pressing ["O", "o"].
-- Uses FileType + opt_local so it wins against built-in ftplugins that re-add "o".
vim.api.nvim_create_autocmd("FileType", {
    pattern = "*",
    callback = function()
        vim.opt_local.formatoptions:remove("o")
    end,
})
