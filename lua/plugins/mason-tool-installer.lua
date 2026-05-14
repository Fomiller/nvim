return {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    dependencies = { "williamboman/mason.nvim" },
    opts = {
        ensure_installed = {
            -- formatters
            "stylua",
            "goimports",
            -- CLI tools (used by conform's terraform_fmt; also useful standalone)
            "terraform",
            "jq",
            "yq",
        },
        auto_update = false,
        run_on_start = true,
    },
}
