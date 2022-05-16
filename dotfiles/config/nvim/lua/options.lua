local o, g, cmd = vim.o, vim.g, vim.cmd

o.updatetime = 500
o.undofile = true
o.confirm = true
o.hidden = true
o.spelllang = "en_au"

--- Search
o.ignorecase = true
o.smartcase = true
o.inccommand = "nosplit"

--- Completion
o.wildignore = '*.o,*~,*.pyc'
o.wildmode = 'longest,full'

--- Tabs/Spaces
o.expandtab = true
o.tabstop = 2
o.softtabstop = 2
o.shiftwidth = 2

-- Hosts

g.python3_host_prog = "/usr/bin/python3"

--- Disabled
g.loaded_ruby_provider = 0
g.loaded_node_provider = 0
g.loaded_perl_provider = 0

-- Display

o.lazyredraw = true
o.number = true
o.numberwidth = 3
o.signcolumn = 'yes:1'

--- Non-printable characters
o.list = true
o.listchars = "eol:¬,tab:>-,trail:.,nbsp:_,extends:+,precedes:+"

--- Scroll
o.scrolloff = 2
o.sidescrolloff = 5

-- Split order
vim.o.splitbelow = true
vim.o.splitright = true

-- Open help in vertical split
cmd("autocmd FileType help wincmd L")
