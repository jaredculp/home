-- pip3 install pyright
local langs = {"pyright", "tsserver"}
for _, lang in ipairs(langs) do
    require('lspconfig')[lang].setup{
        on_attach = function(client, bufnr)
            local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
            local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end
            local opts = {noremap=true, silent=true}

            buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')
            buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
            buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
            buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
        end
    }
end

local null_ls = require('null-ls')
local sources = {
    null_ls.builtins.formatting.black,
    null_ls.builtins.formatting.eslint,
    null_ls.builtins.formatting.isort,
    null_ls.builtins.formatting.prettier,
    null_ls.builtins.diagnostics.eslint,
    null_ls.builtins.diagnostics.flake8,
}
null_ls.setup({sources=sources})

vim.cmd([[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]])
