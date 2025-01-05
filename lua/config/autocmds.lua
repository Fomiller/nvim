local autocmd = vim.api.nvim_create_autocmd

autocmd({ 'BufWritePre' }, {
    pattern = { '*' },
    callback = function()
        vim.lsp.buf.format()
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = { "hcl", "terraform" },
    desc = "terraform/hcl commentstring configuration",
    command = "setlocal commentstring=#\\ %s",
})
