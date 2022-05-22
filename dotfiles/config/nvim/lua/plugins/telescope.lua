local map = vim.api.nvim_set_keymap
local noremap = { noremap = true }
--local silent_noremap = { silent = true, noremap = true }

local telescope = require('telescope')
local actions = require('telescope.actions')

telescope.setup({
  defaults = {
    layout_strategy = 'flex',
    scroll_strategy = 'cycle',
    mappings = {
      i = {
        ['<esc>'] = actions.close,
      },
    },
  },
  extensions = {
    ['ui-select'] = {
      require('telescope.themes').get_dropdown({}),
    },
  },
  pickers = {
    lsp_references = { theme = 'dropdown' },
    lsp_code_actions = { theme = 'dropdown' },
    lsp_definitions = { theme = 'dropdown' },
    lsp_implementations = { theme = 'dropdown' },
    live_grep = { theme = 'dropdown' },
    buffers = {
      ignore_current_buffer = true,
      sort_mru = true,
      theme = 'dropdown',
    },
    find_files = {
      find_command = { 'fd', '--type', 'f', '--strip-cwd-prefix' },
      theme = 'dropdown',
    },
  },
})

telescope.load_extension('fzf')
telescope.load_extension('ui-select')

-- Navigate buffers and repos
vim.keymap.set('n', ';b', require('telescope.builtin').buffers, noremap)
vim.keymap.set('n', ';f', require('telescope.builtin').find_files, noremap)
vim.keymap.set('n', ';g', require('telescope.builtin').live_grep, noremap)
