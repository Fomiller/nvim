return {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
        "MunifTanjim/nui.nvim",
        "rcarriga/nvim-notify",
    },
    opts = {
        cmdline = {
            -- Use vanilla nvim cmdline. Noice's cmdline view closes other windows
            -- (like fugitive's :G status) when activated, so we bypass it entirely.
            enabled = false,
        },
        messages = {
            enabled = false, -- let nvim handle :echo / :G status / etc. traditionally
        },
        lsp = {
            -- Route LSP markdown (hover, signature help) through noice.
            override = {
                ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                ["vim.lsp.util.stylize_markdown"] = true,
            },
            hover = {
                enabled = true,
                silent = true, -- suppress "No information available" noise
            },
            signature = {
                enabled = true,
            },
        },
        presets = {
            bottom_search         = true, -- search prompt at bottom
            long_message_to_split = true, -- long messages go to split, not floating popup
            lsp_doc_border        = true, -- border around hover docs
        },
        -- Filter noisy messages out of the cmdline (tweak as needed).
        routes = {
            {
                filter = { event = "msg_show", kind = "", find = "written" },
                opts = { skip = true }, -- silence ":w" "X bytes written" line
            },
        },
    },
}
