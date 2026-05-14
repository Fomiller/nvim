return {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    lazy = false,
    build = ":TSUpdate",
    config = function()
        local parsers = {
            "bash",
            "c",
            "dockerfile",
            "go",
            "hcl",
            "helm",
            "javascript",
            "jsdoc",
            "json",
            "lua",
            "markdown",
            "markdown_inline",
            "python",
            "rust",
            "terraform",
            "typescript",
            "vimdoc",
            "yaml",
        }

        require("nvim-treesitter").install(parsers)

        local filetypes = {
            "bash",
            "c",
            "dockerfile",
            "go",
            "hcl",
            "javascript",
            "javascriptreact",
            "json",
            "lua",
            "markdown",
            "markdown_inline",
            "python",
            "rust",
            "terraform",
            "typescript",
            "typescriptreact",
            "vimdoc",
            "yaml",
            "helm",
        }

        vim.api.nvim_create_autocmd("FileType", {
            pattern = filetypes,
            callback = function(args)
                pcall(vim.treesitter.start, args.buf)
                vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
            end,
        })

        vim.filetype.add({
            pattern = {
                [".*%.tf"] = "terraform",
                [".*%.tfvars"] = "terraform",
                [".*%.hcl"] = "hcl",
                [".*/templates/.*%.ya?ml"] = "helm",
                [".*/templates/.*%.tpl"] = "helm",
                ["helmfile.*%.ya?ml"] = "helm",
            },
        })
    end,
}
