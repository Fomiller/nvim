return {
    'stevearc/conform.nvim',
    opts = {
        formatters_by_ft ={
            lua = { "stylua"},
            rust = {"rustfmt"},
            go = { "goimports", "gofmt" },
            python = function(bufnr)
                if require("conform").get_formatter_info("ruff_format", bufnr).available then
                    return { "ruff_format" }
                else
                    return { "isort", "black" }
                end
            end,
            nix = {"nixfmt"}
        }
    }
}
