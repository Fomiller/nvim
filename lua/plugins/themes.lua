return {
    { 'folke/tokyonight.nvim',
        name = 'tokyonight',
        config = function ()
            -- vim.cmd.colorscheme("tokyonight-night")
        end
    },
    { "catppuccin/nvim", name = "catppuccin" },
    { 'rose-pine/neovim',
        name = 'rose-pine',
        config = function()
            require("rose-pine").setup({
                highlight_groups = {
                    Normal = { bg = "#000000" },
                    NormalNC = { bg = "#000000"},
                },
            })
            -- vim.cmd.colorscheme("rose-pine")
        end,
    },
    { "bluz71/vim-moonfly-colors",
        name = "moonfly",
        lazy = false, priority = 1000,
        config = function ()
            -- vim.cmd.colorscheme("moonfly")
        end
    },
    {
        "navarasu/onedark.nvim",
        priority = 1000, -- make sure to load this before all the other start plugins
        config = function()
            require('onedark').setup {
                style = 'darker'
            }
            -- Enable theme
            require('onedark').load()
        end
    },
    { "ellisonleao/gruvbox.nvim",
        priority = 1000,
        config = function()
            require("gruvbox").setup({
                -- optional overrides
                contrast = "hard", -- options: 'hard', 'soft', 'medium'
                transparent_mode = false,
            })
            -- vim.cmd.colorscheme("gruvbox")
        end,
    },
    {
        'stevedylandev/darkmatter-nvim',
        lazy = false,
        priority = 1000,
        config = function()
            -- vim.cmd('colorscheme darkmatter')
        end,
    }
}

