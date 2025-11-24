--
-- local builtin = require('telescope.builtin')
-- vim.keymap.set('n', '<leader>sf', builtin.find_files, {})
-- vim.keymap.set('n', '<leader>st', builtin.live_grep, {})
-- vim.keymap.set('n', '<leader>sb', builtin.buffers, {})
-- -- vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
-- vim.keymap.set('n', '<C-p>', builtin.git_files, {})
-- vim.keymap.set('n', '<leader>ps', function()
-- 	builtin.grep_string({search = vim.fn.input("Grep > ") })
-- end)

return { 'nvim-telescope/telescope.nvim',
	dependencies = {
        'nvim-lua/plenary.nvim',
        {
          'nvim-telescope/telescope-fzf-native.nvim',
          build = 'make'  -- compiles the native FZF sorter
        }
    },
    opts = {
        pickers = {
            find_files = {
                hidden = true
            },
            git_files = {
                hidden = true,
                show_untracked = true,
            },
            live_grep = {
                only_sort_text = true,
            },
            grep_string = {
                only_sort_text = true,
            }
        }
    },
    -- extensions = {
    --     fzf = {
    --         fuzzy = false,                   -- enable fuzzy search
    --         override_generic_sorter = true, -- override Telescope generic sorter
    --         override_file_sorter = true,    -- override Telescope file sorter
    --         case_mode = "smart_case",       -- or "ignore_case"/"respect_case"
    --     }
    -- },
    -- config = function(_, opts)
    --     local telescope = require('telescope')
    --     telescope.load_extension('fzf')
    -- end
}
