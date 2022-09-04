local M = {}
local sources = require("null-ls.sources")
local methods = require("null-ls.methods")

-- used if `whitelist_only` is set to false
M.blacklists = {}
M.whitelists = {
  "typescript",
  "javascript",
  "typescriptreact",
  "javascriptreact",
  "html",
  "lua",
  "php",
}
M.whitelist_only = true

M.setup = function()
  for _, ft in ipairs(M.blacklists) do
    M.blacklists[ft] = true
  end
  for _, ft in ipairs(M.whitelists) do
    M.whitelists[ft] = true
  end
end

M.format = function()
  local filetype = vim.bo.filetype

  if M.whitelist_only and not M.whitelists[filetype] then
    return
  elseif not M.whitelist_only and M.blacklists[filetype] then
    return
  end

  local get_methods_per_source = function(source)
    local available_methods = vim.tbl_keys(source.methods)
    return vim.tbl_map(methods.get_readable_name, available_methods)
  end

  local get_active_methods = function()
    local active_methods
    for _, source in ipairs(sources.get_available(filetype)) do
      active_methods = get_methods_per_source(source)
    end

    return active_methods or {}
  end

  -- use null-ls if available for formatting
  for _, method in ipairs(get_active_methods()) do
    if method == "formatting" or method == "range_formatting" then
      return vim.lsp.buf.format({
        filter = function(client)
          return client.name == "null-ls"
        end,
      })
    end
  end

  return vim.lsp.buf.format()
end

M.attach = function(client)
  if client.supports_method("textDocument/formatting") then
    M.setup()

    local group = vim.api.nvim_create_augroup("LspFormatting", { clear = true })
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = group,
      callback = M.format,
    })
  end
end

return M
