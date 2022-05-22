local utils = require('utils')

if utils.file_exists(vim.fn.stdpath('data') .. '/site/pack/packer/start/impatient.nvim') then
  require('impatient')
end

require('config')
require('plugins')
require('lsp')
