return {
    {
        'tpope/vim-fugitive',
        config = function()
            -- Git add current file
            vim.api.nvim_create_user_command("Ga", "Gwrite", {})

            -- Git commit with optional args
            vim.api.nvim_create_user_command("Gc", function(opts)
            vim.cmd("Git commit " .. opts.args)
            end, { nargs = "*" })

            -- Git push
            vim.api.nvim_create_user_command("Gp", "Git push", {})

            -- Git pull
            vim.api.nvim_create_user_command("Gl", "Git pull", {})

            -- Git status
            vim.api.nvim_create_user_command("Gst", "Git status", {})
        end,
    }
}
