-- examples for your init.lua

-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- OR setup with some options
require("nvim-tree").setup({
    view = {
        adaptive_size = false,
        mappings = {
            list = {
                -- remove a default mapping for cd
                { key = "<C-e>", action = "" },
                { key = "<C-t>", action = "" },

                -- -- add multiple normal mode mappings for edit
                -- { key = { "<CR>", "o" }, action = "edit", mode = "n" },
                --
                -- -- custom action
                -- { key = "p", action = "print_the_node_path", action_cb = print_node_path },
            }
        }
    },
    filters = {
        dotfiles = false,
        custom = { "node_modules", "\\.cache" },
        exclude = {},
    },
    update_focused_file = {
        enable = true
    },
    renderer = {
        special_files = {
            "Cargo.toml",
            "Makefile",
            "README.md",
            "README.MD",
            "readme.md",
            "readme.MD",
        },
        icons = {
            webdev_colors = true,
            git_placement = "before",
            padding = " ",
            symlink_arrow = " ➛ ",
            show = {
                file = true,
                folder = true,
                folder_arrow = true,
                git = true,
            },
            glyphs = {
                default = "",
                symlink = "",
                bookmark = "",
                folder = {
                    arrow_closed = "",
                    arrow_open = "",
                    default = "",
                    open = "",
                    empty = "",
                    empty_open = "",
                    symlink = "",
                    symlink_open = "",
                },
                git = {
                    unstaged = "✗",
                    staged = "✓",
                    unmerged = "",
                    renamed = "➜",
                    untracked = "★",
                    deleted = "",
                    ignored = "◌",
                },
            }
        }
    }
})
