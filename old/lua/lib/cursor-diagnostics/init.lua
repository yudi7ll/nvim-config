local M = {}
local toggle_diagnostics = require("lib.toggle-diagnostics")

-- on_attach: show diagnostic on CursorHold
M.attach = function(bufnr)
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
          "BufHidden",
          "WinLeave",
          "VimLeavePre",
        },
        on_close = function()
          vim.api.nvim_buf_clear_namespace(bufnr, 0, 0, -1)
        end,
        source = "always",
        prefix = " ",
        scope = "cursor",
        anchor = "NW",
        row = 1,
        col = 1,
      }

      if toggle_diagnostics.diagnostic_active then
        vim.diagnostic.open_float(nil, opts)
      end
    end,
  })
end

return M
