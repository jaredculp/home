return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
    use 'sainnhe/everforest'
    use 'folke/tokyonight.nvim'
    use 'neovim/nvim-lspconfig'
    use 'nvim-lua/plenary.nvim'
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }
    use 'nvim-telescope/telescope.nvim'
    use {
      'lewis6991/gitsigns.nvim',
      config = function()
        require('gitsigns').setup{}
      end,
    }
    use 'jose-elias-alvarez/null-ls.nvim'

    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'saadparwaiz1/cmp_luasnip'
    use 'L3MON4D3/LuaSnip'
    use {
      'folke/trouble.nvim',
      config = function()
        require('trouble').setup{}
      end,
    }
    use {
      'folke/twilight.nvim',
      config = function()
        require('twilight').setup{}
      end,
    }
    use 'kyazdani42/nvim-web-devicons'
    use 'nvim-lualine/lualine.nvim'
    use {
      'kyazdani42/nvim-tree.lua',
      config = function()
        require('nvim-tree').setup{}
      end,
    }
    use 'wakatime/vim-wakatime'
    use 'themaxmarchuk/tailwindcss-colors.nvim'
    use 'mfussenegger/nvim-dap'
    use 'theHamsta/nvim-dap-virtual-text'
end)
