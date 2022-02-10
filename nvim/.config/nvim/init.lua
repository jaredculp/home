local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
end

require('user.plugins')
require('user.cmp')
require('user.luasnip')
require('user.lsp')
require('user.telescope')
require('user.treesitter')

vim.o.background     = 'dark'
vim.o.completeopt    = 'menuone,noselect'
vim.o.cursorline     = true
vim.o.expandtab      = true
vim.o.number         = true
vim.o.relativenumber = true
vim.o.shiftwidth     = 2
vim.o.softtabstop    = 2
vim.o.splitbelow     = true
vim.o.splitright     = true
vim.o.tabstop        = 2
vim.o.termguicolors  = true
vim.o.showmode       = false
vim.o.colorcolumn    = '80'

vim.g.everforest_background = 'hard'
vim.cmd[[colorscheme everforest]]

require('gitsigns').setup{}
require('trouble').setup{}
require('lualine').setup{}

require('nvim-tree').setup{}
vim.keymap.set('n', '<space><space>', ':NvimTreeToggle<cr>', { noremap=true, silent=true })

require('tailwindcss-colors').setup{}
