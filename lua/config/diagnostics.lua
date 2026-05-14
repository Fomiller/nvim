vim.diagnostic.config({
    severity_sort = true,
    update_in_insert = false,
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = "✘",
            [vim.diagnostic.severity.WARN]  = "▲",
            [vim.diagnostic.severity.INFO]  = "»",
            [vim.diagnostic.severity.HINT]  = "⚑",
        },
    },
    float = {
        focusable = false,
        style = "minimal",
        border = "rounded",
        source = true,
        max_width = 80,
        max_height = 40,
        header = "",
        prefix = "",
    },
    virtual_text = {
        spacing = 2,
        source = "if_many", -- show source (e.g. "tflint") when multiple servers report
        prefix = "●",
    },
})
