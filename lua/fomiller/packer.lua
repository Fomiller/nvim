-- bootstrap
local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer() -- Only required if you have packer configured as `opt`

return require('packer').startup(function(use)
    -- Packer can manage itself
    use { 'wbthomason/packer.nvim' }
    use { 'rose-pine/neovim',
        as = 'rose-pine',
        config = function()
            vim.cmd('colorscheme rose-pine-main')
        end
    }
    -- trying not to use
    -- use { 'akinsho/bufferline.nvim',
    --     tag = "*",
    --     requires = { 'nvim-tree/nvim-web-devicons' }
    -- }
    use { 'folke/tokyonight.nvim', as = 'tokyonight' }
    use { "catppuccin/nvim", as = "catppuccin" }
    use { 'ojroques/nvim-bufdel' }
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
    use { 'nvim-treesitter/playground' }
    use { 'theprimeagen/harpoon' }
    use { 'mbbill/undotree' }
    use { 'NoahTheDuke/vim-just' }
    use { "p00f/nvim-ts-rainbow" }
    use { 'folke/lsp-colors.nvim' }
    use { "tpope/vim-surround" }
    use { "tpope/vim-repeat" }
    use { 'tpope/vim-fugitive' }
    use { 'fatih/vim-go' }
    use { 'nvim-tree/nvim-tree.lua',
        tag = 'nightly', -- optional, updated every week. (see issue #1193)
        requires = { "nvim-tree/nvim-web-devicons" } -- optional
    }
    use { "max397574/better-escape.nvim",
        config = function()
            require("better_escape").setup()
        end
    }
    use { 'nvim-telescope/telescope.nvim',
        requires = { 'nvim-lua/plenary.nvim' }
    }
    -- Lsp
    use { 'VonHeikemen/lsp-zero.nvim',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' },
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },
            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/cmp-path' },
            { 'saadparwaiz1/cmp_luasnip' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/cmp-nvim-lua' },
            -- Snippets
            { 'L3MON4D3/LuaSnip' },
            { 'rafamadriz/friendly-snippets' },
        }
    }
    use { 'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    }
    use { "windwp/nvim-autopairs",
        config = function()
            require("nvim-autopairs").setup()
        end
    }
    -- install without yarn or npm
    use { "iamcco/markdown-preview.nvim",
        run = "cd app && npm install",
        ft = { "markdown" },
        setup = function()
            vim.g.mkdp_filetypes = { "markdown" }
        end
    }
    use { "folke/trouble.nvim",
        requires = { "kyazdani42/nvim-web-devicons" },
        tag = 'v2.*',
        config = function()
            require("trouble").setup()
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
        end
    }
    use { 'nvim-lualine/lualine.nvim',
        requires = {
            'kyazdani42/nvim-web-devicons',
            opt = true
        }
    }

    if packer_bootstrap then
        require('packer').sync()
    end
end)
