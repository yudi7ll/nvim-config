local M = {}
local sources = require("null-ls.sources")
local methods = require("null-ls.methods")

M.whitelist_only = true
-- used if `whitelist_only` is set to false
M.blacklists = {}
-- used if `whitelist_only` is set to true
M.whitelists = {
  typescript = true,
  javascript = true,
  typescriptreact = true,
  javascriptreact = true,
  html = true,
  lua = true,
  php = true,
  json = true,
  jsonc = true,
  blade = true,
  prisma = true,
  dart = true,
}

M.eslint_is_active = function()
  return vim.lsp.get_active_clients({
    name = "eslint",
    bufnr = vim.api.nvim_get_current_buf(),
  })[1]
end

M.get_active_methods = function()
  local filetype = vim.bo.filetype

  local get_methods_per_source = function(source)
    local available_methods = vim.tbl_keys(source.methods)
    return vim.tbl_map(methods.get_readable_name, available_methods)
  end

  local active_methods
  for _, source in ipairs(sources.get_available(filetype)) do
    active_methods = get_methods_per_source(source)
  end

  return active_methods or {}
end

-- auto format buffer but prefer using eslint or null-ls if enabled
M.format = function()
  -- use eslint fix for formatting
  if M.eslint_is_active() then
    return vim.cmd("EslintFixAll")
  end

  -- use null-ls if available for formatting
  for _, method in ipairs(M.get_active_methods()) do
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

M.auto_format = function()
  local filetype = vim.bo.filetype

  if M.whitelist_only and not M.whitelists[filetype] then
    return
  elseif not M.whitelist_only and M.blacklists[filetype] then
    return
  end

  M.format()
end

-- on_attach auto format on save
M.attach = function(client)
  if client.supports_method("textDocument/formatting") then
    local group = vim.api.nvim_create_augroup("LspFormatting", { clear = true })
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = group,
      callback = M.auto_format,
    })
  end
end

return M
