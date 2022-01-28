local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

require('user.plugins')
require('user.cmp')
require('user.lsp')
require('user.telescope')
require('user.treesitter')

vim.o.background     = 'light'
vim.o.completeopt    = 'menuone,noselect'
vim.o.expandtab      = true
vim.o.number         = true
vim.o.relativenumber = true
vim.o.shiftwidth     = 2
vim.o.softtabstop    = 2
vim.o.splitbelow     = true
vim.o.splitright     = true
vim.o.tabstop        = 2
vim.o.termguicolors  = true

vim.g.everforest_background = 'soft'
vim.cmd[[colorscheme everforest]]

require('gitsigns').setup{}
