return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
    use 'sainnhe/everforest'
    use 'neovim/nvim-lspconfig'
    use 'nvim-lua/plenary.nvim'
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }
    use 'nvim-telescope/telescope.nvim'
    use 'lewis6991/gitsigns.nvim'
    use 'jose-elias-alvarez/null-ls.nvim'

    if packer_bootstrap then
        require('packer').sync()
    end
end)

