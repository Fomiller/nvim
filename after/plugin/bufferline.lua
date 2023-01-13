vim.opt.termguicolors = true

-- :help bufferline-styling
require("bufferline").setup {
    options = {
        diagnostics = "nvim_lsp",
        diagnostics_update_in_insert = false,
        seperator_style = "thin", -- slant, padded_slant, thick, thin
        show_buffer_close_icons = false,
        indicator = {
            style = 'underline'
        },
        hover = {
            enabled = true,
            delay = 200,
            reveal = { 'close' }
        },
        highlights = {
            background = {
                italic = true,
            },
            buffer_selected = {
                bold = true,
            },
        },
        offsets = {
            {
                filetype = "undotree",
                text = "Undotree",
                highlight = "PanelHeading",
                padding = 1,
            },
            {
                filetype = "NvimTree",
                text = "Explorer",
                highlight = "PanelHeading",
                padding = 1,
            },
            {
                filetype = "DiffviewFiles",
                text = "Diff View",
                highlight = "PanelHeading",
                padding = 1,
            },
            {
                filetype = "flutterToolsOutline",
                text = "Flutter Outline",
                highlight = "PanelHeading",
            },
            {
                filetype = "packer",
                text = "Packer",
                highlight = "PanelHeading",
                padding = 1,
            },
        },
    }
}
