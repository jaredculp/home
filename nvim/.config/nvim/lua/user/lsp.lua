local lsp = require('lspconfig')

local on_attach = function(client, bufnr)
  local opts = { buffer = bufnr, noremap = true, silent = true }
  -- navigation
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
  vim.keymap.set('n', 'K',  vim.lsp.buf.hover, opts)

  -- actions
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
  vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, opts)

  -- diagnostics
  vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
  vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
  vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)

  -- delegate formatting to null-ls
  client.resolved_capabilities.document_formatting = false
  client.resolved_capabilities.document_range_formatting = false
  vim.cmd[[autocmd BufWritePre * lua vim.lsp.buf.formatting()]]

  if client.name == 'tailwindcss' then
    local tailwind = require('tailwindcss-colors')
    tailwind.setup{}
    tailwind.buf_attach(bufnr)
  end
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

local langs = { 'pyright', 'tsserver', 'tailwindcss', 'terraformls' }
for _, lang in ipairs(langs) do
  lsp[lang].setup({
    on_attach = on_attach,
    capabilities = capabilities,
    single_file_support = true,
  })
end

local null_ls = require('null-ls')
local sources = {
  null_ls.builtins.formatting.black.with({
    --extra_args = { "-l", "79", "--experimental-string-processing" },
  }),
  null_ls.builtins.formatting.eslint,
  null_ls.builtins.formatting.isort.with({
    extra_args = { "--profile", "black", "-ac", "-e" },
  }),
  null_ls.builtins.formatting.prettier,
  null_ls.builtins.diagnostics.eslint,
  null_ls.builtins.diagnostics.flake8,
}
null_ls.setup({
  sources=sources
})
