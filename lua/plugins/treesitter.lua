return {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",  -- Ensures parsers are updated after installation
    event = { "BufReadPost", "BufNewFile" },  -- Load Treesitter when opening a file
    config = function()
        require("nvim-treesitter.configs").setup({
            -- A list of parser names, or "all"
            ensure_installed = {
                "bash",
                "c",
                "dockerfile",
                "go",
                "hcl",
                "javascript",
                "jsdoc",
                "json",
                "lua",
                "python",
                "rust",
                "terraform",
                "typescript",
                "vimdoc",
                "yaml",
            },
            -- Install parsers synchronously (only applied to `ensure_installed`)
            sync_install = false,
            -- Automatically install missing parsers when entering buffer
            highlight = { enable = true, additional_vim_regex_highlighting = false },
            indent = { enable = true },
            incremental_selection = { enable = true },
            auto_install = true
        })

        -- extra filetype setup
        vim.filetype.add({
            pattern = {
                [".*%.tf"] = "terraform",
                [".*%.tfvars"] = "terraform",
                [".*%.hcl"] = "hcl",
            },
        })
    end
}
