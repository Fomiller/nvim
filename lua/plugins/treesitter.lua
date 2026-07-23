return {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    lazy = false,
    build = ":TSUpdate",
    config = function()
        -- To add language support:
        --   1) Append the parser name below.
        --   2) Restart nvim — `install(parsers)` compiles missing ones on startup.
        --   3) Run `:TSUpdate` later to refresh existing parsers to upstream HEAD.
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

        -- Filetypes that should get treesitter highlighting + indent. By default
        -- this is just `parsers`; extras here are filetypes that map to a parser
        -- with a different name (e.g. jsx → javascript).
        local filetypes = vim.list_extend(vim.deepcopy(parsers), {
            "javascriptreact",
            "typescriptreact",
        })

        vim.api.nvim_create_autocmd("FileType", {
            pattern = filetypes,
            callback = function(args)
                pcall(vim.treesitter.start, args.buf)
                vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
            end,
        })

        -- Filetype detection patterns. Kept here because they exist to make the
        -- FileType autocmd above attach to the right files (helm/terraform/hcl
        -- have non-trivial detection rules).
        vim.filetype.add({
            -- `.jinja` is already detected by neovim's builtin filetype rules,
            -- but `.j2`/`.jinja2` are not. jinja_lsp (see config/lsp-servers.lua)
            -- only attaches to the `jinja` filetype, so map them here.
            extension = {
                j2     = "jinja",
                jinja2 = "jinja",
            },
            pattern = {
                [".*%.tf"]                 = "terraform",
                [".*%.tfvars"]             = "terraform",
                [".*%.hcl"]                = "hcl",
                [".*/templates/.*%.ya?ml"] = "helm",
                [".*/templates/.*%.tpl"]   = "helm",
                ["helmfile.*%.ya?ml"]      = "helm",
            },
        })
    end,
}
