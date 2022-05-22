local treesitter = require('nvim-treesitter.configs')
local spellsitter = require('spellsitter')

treesitter.setup({
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
  -- Auto-close tags
  autotag = {
    enable = true,
  },
  -- Adds `end` in Lua/Ruby/etc
  endwise = {
    enable = true,
  },
  -- Smart text object selection
  textsubjects = {
    enable = true,
    keymaps = {
      ['.'] = 'textsubjects-smart',
      [';'] = 'textsubjects-container-outer',
      ['i;'] = 'textsubjects-container-inner',
    },
  },
  -- Rainbow parens
  rainbow = {
    enable = true,
    extended_mode = true,
    max_file_lines = nil,
  },
  -- Refactor tools
  refactor = {
    highlight_definitions = { enable = true },
    smart_rename = {
      enable = true,
      keymaps = {
        smart_rename = 'grr',
      },
    },
  },
})

-- Prevent spell-check from including code
spellsitter.setup({
  enable = true,
})
