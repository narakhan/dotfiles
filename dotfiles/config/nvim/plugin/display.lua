local o, g, fn, cmd = vim.o, vim.g, vim.fn, vim.cmd

if fn.has('termguicolors') == 1 then
  o.termguicolors = true
end

-- Sonokai

g.sonokai_style = 'andromeda'
g.sonokai_better_performance = 1

cmd('colorscheme sonokai')

-- Visible indent lines

require("indent_blankline").setup {
  use_treesitter = true,
  show_first_indent_level = true,
  show_trailing_blankline_indent = false,
}
