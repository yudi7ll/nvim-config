return function(event, pattern, callback, desc)
  local gr = vim.api.nvim_create_augroup("CustomAugroup", { clear = false })
  vim.api.nvim_create_autocmd(event, { group = gr, pattern = pattern, callback = callback, desc = desc })
end
