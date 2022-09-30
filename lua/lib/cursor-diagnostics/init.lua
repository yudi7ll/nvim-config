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
        },
        source = "always",
        prefix = " ",
        scope = "cursor",
      }

      if toggle_diagnostics.diagnostic_active then
        vim.diagnostic.open_float(nil, opts)
      end
    end,
  })
end

return M
