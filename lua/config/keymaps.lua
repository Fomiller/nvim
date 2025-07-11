Utils = require('config.functions.utils')
-- commands = require('fomiller.functions.commands')w

-- toggle nvim tree
vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<CR>")
-- write file
vim.keymap.set("n", "<leader>w", "<cmd>w!<CR>")
-- quit and prompt "are you sure" if file has not been saved
vim.keymap.set("n", "<leader>q", "<cmd>lua Utils.Smart_quit()<CR>")
-- delete buffer
vim.keymap.set("n", "<leader>c", "<cmd>BufDel<CR>")
-- move line down in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
-- move line up in visual mode
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
-- move line below to current line
vim.keymap.set("n", "J", "mzJ`z")
-- center cursor after <C-d>
vim.keymap.set("n", "<C-d>", "<C-d>zz")
-- center cursor after <C-u>
vim.keymap.set("n", "<C-u>", "<C-u>zz")
-- Remap 'n' to search for the next match and re-center the cursor
vim.keymap.set("n", "n", "nzzzv")
-- Remap 'N' to search for the previous match and re-center the cursor
vim.keymap.set("n", "N", "Nzzzv")
-- Remap <leader>p to delete the selected text and paste the clipboard content
vim.keymap.set("x", "<leader>p", [["_dP]])

-- yanks current line in visual mode to system buffer
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
-- yanks current line in normal mode to system buffer
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])

-- This is going to get me cancelled
vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "Q", "<nop>")

-- format file (should do this automatically..)
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- search and replace word under cursor
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- automatically set file to executable
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- toggle comments in visual and normal mode
vim.keymap.set("n", "<leader>/", "<Plug>(comment_toggle_linewise_current)")
vim.keymap.set("v", "<leader>/", "<Plug>(comment_toggle_linewise_visual)")

-- vim-fugitive
vim.keymap.set("n", "<leader>gs", vim.cmd.Git)
vim.keymap.set("n", "<leader>ga", ":G add ")
vim.keymap.set("n", "<leader>gc", ":G commit -m '")
vim.keymap.set("n", "<leader>gp", ":G push")

-- harpoon
local mark = require("harpoon.mark")
local ui = require("harpoon.ui")
vim.keymap.set("n", "<leader>a", mark.add_file)
vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu)
vim.keymap.set("n", "<C-t>", function() ui.nav_file(1) end)
vim.keymap.set("n", "<C-g>", function() ui.nav_file(2) end)
vim.keymap.set("n", "<C-b>", function() ui.nav_file(3) end)
vim.keymap.set("n", "<C-y>", function() ui.nav_file(4) end)

-- telescope
require('telescope').load_extension("todo-comments")
local telescope = require('telescope.builtin')
vim.keymap.set('n', '<leader>sf', telescope.find_files, {})
vim.keymap.set('n', '<leader>st', telescope.live_grep, {})
vim.keymap.set('n', '<leader>sb', telescope.buffers, {})
vim.keymap.set('n', '<leader>sg', telescope.git_files, {})
vim.keymap.set('n', '<leader>ss', function() local word = vim.fn.expand("<cword>") telescope.grep_string({ search = word }) end)
vim.keymap.set('n', '<leader>SS', function() local word = vim.fn.expand("<cWORD>") telescope.grep_string({ search = word }) end)
vim.keymap.set('n', '<leader>sh', telescope.help_tags, {}) -- nvim help docs
vim.keymap.set('n', '<leader>sh', telescope.help_tags, {}) -- nvim help docs

-- todo-comments
vim.keymap.set("n", "]t", function() require("todo-comments").jump_next() end, { desc = "Next todo comment" })
vim.keymap.set("n", "[t", function() require("todo-comments").jump_prev() end, { desc = "Previous todo comment" })

-- undotree
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)

-- windows navigation (dont really use anymore, but keeping anyways)
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")
vim.keymap.set("n", "<C-Up>", ":resize -2<CR>")
vim.keymap.set("n", "<C-Down>", ":resize +2<CR>")
vim.keymap.set("n", "<C-Left>", ":vertical resize -2<CR>")
vim.keymap.set("n", "<C-Right>", ":vertical resize +2<CR>")

-- bufferline mappings
-- I dont use bufferline plugin anymore
-- vim.keymap.set("n", "<leader>bb", "<cmd>BufferLineCyclePrev<cr>")
-- vim.keymap.set("n", "<leader>bn", "<cmd>BufferLineCycleNext<cr>")
-- vim.keymap.set("n", "<leader>bh", "<cmd>BufferLineCloseLeft<cr>")
-- vim.keymap.set("n", "<leader>bh", "<cmd>BufferLineCloseRight<cr>")
-- vim.keymap.set("n", "<leader>bD", "<cmd>BufferLineSortByDirectory<cr>")
-- vim.keymap.set("n", "<leader>bE", "<cmd>BufferLineSortByExtension<cr>")
-- vim.keymap.set("n", "<leader>bE", "<cmd>BufferLineSortByExtension<cr>")
-- vim.keymap.set("n", "H", "<cmd>BufferLineCyclePrev<CR>")
-- vim.keymap.set("n", "L", "<cmd>BufferLineCycleNext<CR>")
-- vim.keymap.set("n", "bd", "<cmd>BufferLineSortByDirectory<CR>", { silent = true })
-- vim.keymap.set("n", "be", "<cmd>BufferLineSortByExtension<CR>", { silent = true })
-- vim.keymap.set("n", "bp", "<cmd>BufferLinePick<CR>", { silent = true })
