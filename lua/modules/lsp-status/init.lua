local lsp_status = require("lsp-status")

lsp_status.register_progress()
lsp_status.config({
  status_symbol = "",
  status = "",
  indicator_ok = "",
  current_function = false,
  diagnostics = false,
})
