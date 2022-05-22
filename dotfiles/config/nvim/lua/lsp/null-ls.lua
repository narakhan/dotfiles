local null_ls = require('null-ls')
local b = null_ls.builtins

local sources = {
  -- Formatting
  b.formatting.black,
  b.formatting.clang_format,
  b.formatting.isort,
  b.formatting.prettier,
  b.formatting.rustfmt,
  b.formatting.shfmt,
  b.formatting.stylua,
  b.formatting.trim_newlines,
  b.formatting.trim_whitespace,

  -- Diagnostics
  b.diagnostics.eslint,
  b.diagnostics.selene,
  b.diagnostics.shellcheck,
  b.diagnostics.vint,
  b.diagnostics.write_good,

  -- Code Actions
  b.code_actions.gitrebase,
  b.code_actions.gitsigns,
}

return {
  setup = (function(on_attach)
    null_ls.setup({
        -- debug = true,
        sources = sources,
        on_attach = on_attach,
    })
  end)
}
