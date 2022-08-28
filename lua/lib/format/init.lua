local M = {}

-- used if `whitelist_only` is set to false
M.blacklists = {}
M.whitelists = {
  "typescript",
  "javascript",
  "typescriptreact",
  "javascriptreact",
  "html",
  "lua",
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

  return vim.lsp.buf.format()
end

M.on_attach = function(client)
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
