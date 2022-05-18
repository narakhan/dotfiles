local null = require('null-ls')

-- null-ls setup
local null_fmt = null.builtins.formatting
local null_diag = null.builtins.diagnostics
local null_cmp = null.builtins.completion
local null_act = null.builtins.code_actions

null.setup {
  sources = {
    -- Default
    null_fmt.prettier,

    -- JavaScript
    null_diag.eslint,

    -- Lua
    null_fmt.stylua,
    null_diag.selene,
  }
}


-- null_ls.setup {
--   sources = {
--     null_diag.chktex,
--     -- null_diag.cppcheck,
--     -- null_diag.proselint,
--     -- null_diag.pylint,
--     null_diag.selene,
--     null_diag.shellcheck,
--     null_diag.teal,
--     -- null_diag.vale,
--     null_diag.vint,
--     null_diag.write_good.with { filetypes = { 'markdown', 'tex' } },
--     null_fmt.clang_format,
--     null_fmt.cmake_format,
--     null_fmt.isort,
--     null_fmt.prettier,
--     null_fmt.rustfmt,
--     null_fmt.shfmt,
--     null_fmt.stylua,
--     null_fmt.trim_whitespace,
--     null_fmt.yapf,
--     -- null_fmt.black
--     null_act.gitsigns,
--     null_act.refactoring.with { filetypes = { 'javascript', 'typescript', 'lua', 'python', 'c', 'cpp' } },
--   },
--   on_attach = on_attach,
-- }
