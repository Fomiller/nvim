vim.diagnostic.config({
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
    virtual_text = true,
    -- virtual_lines = true
})
