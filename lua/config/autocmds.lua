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
    command = "setlocal commentstring=#\\ %s",
})

-- setup keys bindings when lsp attaches
autocmd('LspAttach', {
    callback = function(e)
        local opts = { buffer = e.buf }
        -- vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
        vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
        -- vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
        vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
        vim.keymap.set("n", "<leader>ca", function() vim.lsp.buf.code_action() end, opts)
        vim.keymap.set("n", "<leader>rr", function() vim.lsp.buf.references() end, opts)
        vim.keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end, opts)
        vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
        -- vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
        -- vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
    end
})

-- Prevent automatic comment continuation when pressing ["O", "o"]
vim.api.nvim_create_autocmd("BufEnter", {
    pattern = "*",
    callback = function()
        vim.opt.formatoptions:remove({"o"})
    end,
})
