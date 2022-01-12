require('telescope').setup{
    pickers = {
        find_files = {
            theme = 'ivy'
        },
        live_grep = {
            theme = 'ivy'
        }
    }
}

vim.api.nvim_set_keymap('n', '<C-f>', "<cmd>lua require('telescope.builtin').find_files()<CR>", {noremap = true})
vim.api.nvim_set_keymap('n', '<C-g>', "<cmd>lua require('telescope.builtin').live_grep()<CR>", {noremap = true})
