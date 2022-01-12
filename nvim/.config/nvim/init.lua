local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

require('user.plugins')
require('user.lsp')
require('user.telescope')

vim.o.number         = true
vim.o.relativenumber = true
vim.o.shiftwidth     = 4
vim.o.tabstop        = 4
vim.o.softtabstop    = 4
vim.o.expandtab      = true
vim.o.completeopt    = 'menu,menuone,noselect'
vim.o.background     = 'light'
vim.o.termguicolors  = true
vim.o.background     = 'dark'

vim.g.everforest_background = 'hard'
vim.cmd[[colorscheme everforest]]

require('nvim-treesitter.configs').setup{
    ensure_installed = 'python',
    highlight = {
        enable = true
    },
    indent = {
        enable = true
    }
}

require('gitsigns').setup{}
