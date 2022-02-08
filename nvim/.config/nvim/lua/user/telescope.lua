require('telescope').setup{
  pickers = {
    find_files = {
      theme = 'ivy'
    },
    live_grep = {
      theme = 'ivy'
    },
    buffers = {
      theme = 'ivy'
    },
    lsp_references = {
      theme = 'ivy'
    }
  }
}

local opts = { noremap=true, silent = true }
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<space>f', builtin.find_files, opts)
vim.keymap.set('n', '<space>g', builtin.live_grep, opts)
vim.keymap.set('n', '<space>b', builtin.buffers, opts)
