local g, o = vim.g, vim.o
local map = vim.api.nvim_set_keymap
local noremap = { noremap = true }

-- Make backspace more consistent
o.backspace = "indent,eol,start"

-- Leader key
g.mapleader = " "
g.maplocalleader = " "

-- Disable <F1> help
map('', '<f1>', '<nop>', noremap)

-- ctrl-{h,j,k,l} to move between splits
for _, mode in pairs({ 't', 'i' }) do
  map(mode, '<C-h>', '<C-\\><C-N><C-w>h', noremap)
  map(mode, '<C-j>', '<C-\\><C-N><C-w>j', noremap)
  map(mode, '<C-k>', '<C-\\><C-N><C-w>k', noremap)
  map(mode, '<C-l>', '<C-\\><C-N><C-w>l', noremap)
end

map('n', '<C-h>', '<C-w>h', noremap)
map('n', '<C-j>', '<C-w>j', noremap)
map('n', '<C-k>', '<C-w>k', noremap)
map('n', '<C-l>', '<C-w>l', noremap)


-- Make <ESC> exit terminal mode, and make <C-v> insert an <ESC>
map('t', '<ESC>', '<C-\\><C-n>', noremap)
map('t', '<C-v>', '<ESC>', noremap)

-- Center view on search results
map('n', 'n', 'nzz', noremap)
map('n', 'N', 'Nzz', noremap)

-- Search
map('n', '<esc>', '<cmd>noh<cr><esc>', noremap)
