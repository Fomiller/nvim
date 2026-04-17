return {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = ":call mkdp#util#install()",
    ft = { "markdown" },
    config = function()
        vim.g.mkdp_auto_close = 1
        vim.g.mkdp_open_to_the_world = 0
        vim.g.mkdp_browser = ""
    end,
}
