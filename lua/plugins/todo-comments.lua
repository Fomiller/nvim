return {
  "folke/todo-comments.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = {},
    keys = {
        {
            "<leader>td",
            "<cmd>TodoTelescope<cr>",
        },
        {
            "<leader>tq",
            "<cmd>TodoQuickFix<cr>",
        },
    }
}
