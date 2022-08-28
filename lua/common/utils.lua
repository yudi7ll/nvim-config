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

M.show_diagnostic_under_cursor = function(bufnr)
  vim.api.nvim_create_autocmd("CursorHold", {
    buffer = bufnr,
    callback = function()
      local opts = {
        focusable = false,
        close_events = {
          "BufLeave",
          "CursorMoved",
          "InsertEnter",
          "FocusLost",
          "DiffUpdated",
        },
        source = "always",
        prefix = " ",
        scope = "cursor",
      }
      vim.diagnostic.open_float(nil, opts)
    end,
  })
end

M.show_tab_size = function()
  return "spaces " .. vim.bo.shiftwidth
end

M.show_file_path = function()
  return string.gsub(
    ---@diagnostic disable-next-line: missing-parameter
    vim.fn.fnamemodify(vim.fn.expand("%"), ":p:~:."),
    "/",
    " > "
  )
end

return M
