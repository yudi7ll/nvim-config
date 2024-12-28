-- TODO:
return function(hl_groups)
  for _, hl_group in pairs(hl_groups) do
    vim.api.nvim_set_hl(0, hl_group[1], hl_group[2])
  end
end
