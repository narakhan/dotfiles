local border_opts = {
  border = 'single',
  focusable = false,
  scope = 'line',
}

vim.diagnostic.config({ virtual_text = false, float = border_opts })

vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(
  vim.lsp.handlers.signature_help,
  border_opts
)
vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(
  vim.lsp.handlers.hover,
  border_opts
)

vim.api.nvim_create_autocmd('CursorHold', {
  callback = function()
    vim.diagnostic.open_float()
  end,
})

vim.api.nvim_create_autocmd('CursorHoldI', {
  callback = function()
    vim.lsp.buf.signature_help()
  end,
})

local on_attach = function(client, bufnr)
  local opts = { buffer = bufnr }
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
  vim.keymap.set('n', 'gd', require('telescope.builtin').lsp_definitions, opts)
  vim.keymap.set(
    'n',
    'gi',
    require('telescope.builtin').lsp_implementations,
    opts
  )
  vim.keymap.set('n', 'gr', require('telescope.builtin').lsp_references, opts)
  vim.keymap.set(
    'n',
    'gt',
    require('telescope.builtin').lsp_type_definitions,
    opts
  )
  vim.keymap.set('n', 'ge', require('telescope.builtin').diagnostics, opts)
  vim.keymap.set('n', ']e', vim.diagnostic.goto_next, opts)
  vim.keymap.set('n', '[e', vim.diagnostic.goto_prev, opts)
  vim.keymap.set('n', '<leader>r', vim.lsp.buf.rename, opts)
  vim.keymap.set('n', '<leader>a', vim.lsp.buf.code_action, opts)
  vim.keymap.set('n', '<leader>f', vim.lsp.buf.formatting, opts)

  require('illuminate').on_attach(client)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

local servers = {
  'ccls',
  'eslint',
  'pyright',
  'sumneko_lua',
  'null-ls',
}

for _, server in ipairs(servers) do
  require('lsp.' .. server).setup(on_attach, capabilities)
end
