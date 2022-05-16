local map = vim.api.nvim_set_keymap
local noremap = { noremap = true }
--local silent_noremap = { silent = true, noremap = true }

local telescope = require 'telescope'
local actions = require 'telescope.actions'

telescope.setup {
  defaults = {
    layout_strategy = 'flex',
    scroll_strategy = 'cycle',
    mappings = {
      i = {
        ["<esc>"] = actions.close,
      },
    },
  },
  extensions = {
    ['ui-select'] = {
      require("telescope.themes").get_dropdown {},
    },
  },
  pickers = {
    lsp_references = { theme = 'dropdown' },
    lsp_code_actions = { theme = 'dropdown' },
    lsp_definitions = { theme = 'dropdown' },
    lsp_implementations = { theme = 'dropdown' },
    buffers = {
      ignore_current_buffer = true,
      sort_mru = true,
      previewer = false,
    },
    find_files = {
      find_command = { "fd", "--type", "f", "--strip-cwd-prefix" },
    },
  },
}

telescope.load_extension("fzf")
telescope.load_extension("frecency")
telescope.load_extension("ui-select")

-- Navigate buffers and repos
map('n', ';b', [[<cmd>Telescope buffers show_all_buffers=true theme=get_dropdown<cr>]], noremap)
map('n', ';f', [[<cmd>Telescope find_files theme=get_dropdown<cr>]], noremap)
map('n', ';g', [[<cmd>Telescope live_grep theme=get_dropdown<cr>]], noremap)
