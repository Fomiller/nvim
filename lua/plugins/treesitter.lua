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
            "jinja",
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
            -- Plain `.jinja` is builtin-detected; `.j2`/`.jinja2` are not.
            -- These use stock {{ }} / {% %} delimiters -> `jinja` (treesitter).
            extension = {
                j2     = "jinja",
                jinja2 = "jinja",
            },
            pattern = {
                -- Flock golden-file templates named <base>.jinja (e.g.
                -- account.hcl.jinja) use custom @{ }@ / @% %@ delimiters, which
                -- neither treesitter nor jinja-lsp understand. Route them to the
                -- `jinjatmpl` filetype (see syntax/jinjatmpl.vim), stashing the
                -- base extension so it can load that language's classic syntax.
                -- A plain `.jinja` (no inner extension) stays `jinja`.
                [".*%.jinja"] = function(path)
                    local base = path:match("%.(%w+)%.jinja$")
                    if not base then
                        return "jinja"
                    end
                    return "jinjatmpl", function(bufnr)
                        vim.b[bufnr].jinja_base_ext = base
                    end
                end,
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
