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

function M.nmap(key, cmd, config)
  map("n", key, cmd, config)
end

function M.xmap(key, cmd, config)
  map("x", key, cmd, config)
end

function M.imap(key, cmd, config)
  map("i", key, cmd, config)
end

function M.smap(key, cmd, config)
  map("s", key, cmd, config)
end

function M.tmap(key, cmd, config)
  map("t", key, cmd, config)
end

function M.vmap(key, cmd, config)
  map("v", key, cmd, config)
end

return M
