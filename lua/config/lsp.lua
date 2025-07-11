vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
    style = "minimal",
    border = "rounded",
    max_width = 80,
    max_height = 40,
})
