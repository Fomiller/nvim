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

-- LspAttach keymaps live in lua/plugins/nvim-lspconfig.lua so all LSP wiring is in one place.

-- Prevent automatic comment continuation when pressing ["O", "o"].
-- Uses FileType + opt_local so it wins against built-in ftplugins that re-add "o".
vim.api.nvim_create_autocmd("FileType", {
    pattern = "*",
    callback = function()
        vim.opt_local.formatoptions:remove("o")
    end,
})
