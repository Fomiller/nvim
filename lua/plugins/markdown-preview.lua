return { "iamcco/markdown-preview.nvim",
    enabled = false,
    init = "cd app && npm install",
    ft = { "markdown" },
    setup = function()
        vim.g.mkdp_filetypes = { "markdown" }
    end
}
