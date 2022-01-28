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
vim.api.nvim_set_keymap('n', '<C-F>', [[cmd>lua require('telescope.builtin').find_files()<CR>]], opts)
vim.api.nvim_set_keymap('n', '<C-G>', [[<cmd>lua require('telescope.builtin').live_grep()<CR>]], opts)
vim.api.nvim_set_keymap('n', '<C-T>', [[<cmd>lua require('telescope.builtin').buffers()<CR>]], opts)
