Utils = require('fomiller.functions.utils')
-- commands = require('fomiller.functions.commands')w

vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<CR>")

vim.keymap.set("n", "<leader>w", "<cmd>w!<CR>")
vim.keymap.set("n", "<leader>q", "<cmd>lua Utils.Smart_quit()<CR>")
vim.keymap.set("n", "<leader>c", "<cmd>BufDel<CR>")

-- bufferline mappings
vim.keymap.set("n", "H", "<cmd>BufferLineCyclePrev<CR>")
vim.keymap.set("n", "L", "<cmd>BufferLineCycleNext<CR>")
vim.keymap.set("n", "bd", "<cmd>BufferLineSortByDirectory<CR>", { silent = true })
vim.keymap.set("n", "be", "<cmd>BufferLineSortByExtension<CR>", { silent = true })
vim.keymap.set("n", "bp", "<cmd>BufferLinePick<CR>", { silent = true })

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])

-- This is going to get me cancelled
vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "Q", "<nop>")

-- vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- automatically set file to executable
-- vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- -- windows navigation
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")
vim.keymap.set("n", "<C-Up>", ":resize -2<CR>")
vim.keymap.set("n", "<C-Down>", ":resize +2<CR>")
vim.keymap.set("n", "<C-Left>", ":vertical resize -2<CR>")
vim.keymap.set("n", "<C-Right>", ":vertical resize +2<CR>")

vim.keymap.set("n", "<leader>/", "<Plug>(comment_toggle_linewise_current)")
vim.keymap.set("v", "<leader>/", "<Plug>(comment_toggle_linewise_visual)")

-- fugitive
vim.keymap.set("n", "<leader>gs", vim.cmd.Git)
vim.keymap.set("n", "<leader>ga", ":G add ")
vim.keymap.set("n", "<leader>gc", ":G commit -m '")
vim.keymap.set("n", "<leader>gp", ":G push")

-- buffers
vim.keymap.set("n", "<leader>bb", "<cmd>BufferLineCyclePrev<cr>")
vim.keymap.set("n", "<leader>bn", "<cmd>BufferLineCycleNext<cr>")
vim.keymap.set("n", "<leader>bh", "<cmd>BufferLineCloseLeft<cr>")
vim.keymap.set("n", "<leader>bh", "<cmd>BufferLineCloseRight<cr>")
vim.keymap.set("n", "<leader>bD", "<cmd>BufferLineSortByDirectory<cr>")
vim.keymap.set("n", "<leader>bE", "<cmd>BufferLineSortByExtension<cr>")
vim.keymap.set("n", "<leader>bE", "<cmd>BufferLineSortByExtension<cr>")
