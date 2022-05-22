-- Opt in performance improvements
vim.g.do_filetype_lua = 1
vim.g.did_load_filetypes = 0

require('bindings')
require('options')

-- New

require('plugins')
require('lsp')
