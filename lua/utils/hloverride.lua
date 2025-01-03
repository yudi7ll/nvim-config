return function(hl_groups)
  for key, hl_opts in pairs(hl_groups) do
    vim.api.nvim_set_hl(0, key, hl_opts)
  end
end
