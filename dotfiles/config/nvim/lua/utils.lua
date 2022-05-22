local Utils = {}

local cmd = vim.cmd
local o_s = vim.o
local map_key = vim.api.nvim_set_keymap

function Utils.file_exists(path)
  local fd = io.open(path, 'r')

  if fd ~= nil then
    io.close(fd)

    return true
  else
    return false
  end
end

function Utils.opt(o, v, scopes)
  scopes = scopes or { o_s }
  for _, s in ipairs(scopes) do
    s[o] = v
  end
end

function Utils.autocmd(group, cmds, clear)
  clear = clear == nil and false or clear
  if type(cmds) == 'string' then
    cmds = { cmds }
  end
  cmd('augroup ' .. group)
  if clear then
    cmd([[au!]])
  end
  for _, c in ipairs(cmds) do
    cmd('autocmd ' .. c)
  end
  cmd([[augroup END]])
end

function Utils.map(modes, lhs, rhs, opts)
  opts = opts or {}
  opts.noremap = opts.noremap == nil and true or opts.noremap
  if type(modes) == 'string' then
    modes = { modes }
  end
  for _, mode in ipairs(modes) do
    map_key(mode, lhs, rhs, opts)
  end
end

return Utils
