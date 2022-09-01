local M = {}

local map = function(mode, key, cmd, config)
  vim.keymap.set(
    mode,
    key,
    cmd,
    vim.tbl_extend("force", {
      noremap = true,
      silent = true,
    }, config or {})
  )
end

M.nmap = function(key, cmd, config)
  map("n", key, cmd, config)
end

M.xmap = function(key, cmd, config)
  map("x", key, cmd, config)
end

M.imap = function(key, cmd, config)
  map("i", key, cmd, config)
end

M.smap = function(key, cmd, config)
  map("s", key, cmd, config)
end

M.tmap = function(key, cmd, config)
  map("t", key, cmd, config)
end

M.vmap = function(key, cmd, config)
  map("v", key, cmd, config)
end

return M
