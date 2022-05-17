-- local ts_configs = require 'nvim-treesitter.configs'
-- ts_configs.setup {
--   highlight = { enable = true, use_languagetree = true },
--   indent = { enable = false },
--   refactor = {
--     smart_rename = { enable = true, keymaps = { smart_rename = 'grr' } },
--     highlight_definitions = { enable = true },
--     -- highlight_current_scope = { enable = true }
--   },
--   textsubjects = {
--     enable = true,
--     keymaps = {
--       ['.'] = 'textsubjects-smart',
--       [';'] = 'textsubjects-container-outer',
--     },
--   },
--   endwise = { enable = true },
-- }

local treesitter = require('nvim-treesitter.configs')

treesitter.setup {
  -- Prefer to have all parsers on hand
  ensure_installed = 'all',
  highlight = {
    enable = true,
  },
  -- These are the defaults am including for visibility
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = 'gnn',
      node_incremental = 'grn',
      scope_incremental = 'grc',
      node_decremental = 'grm',
    },
  },
}
