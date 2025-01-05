local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>sf', builtin.find_files, {})
vim.keymap.set('n', '<leader>st', builtin.live_grep, {})
vim.keymap.set('n', '<leader>sb', builtin.buffers, {})
-- vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', function()
	builtin.grep_string({search = vim.fn.input("Grep > ") })
end)

require('telescope').setup{
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
}
