---@class Mapping : vim.keymap.set.Opts
---@field [1] string lhs
---@field [2] string|function rhs
---@field mode? string|string[]

---@type vim.keymap.set.Opts
local default_opts = {
  silent = true,
  noremap = true,
}

---@param mapping Mapping
---@param global_opts? vim.keymap.set.Opts
local set = function(mapping, global_opts)
  if type(mapping) ~= "table" then
    error "Parameter mapping must be a table"
  end
  local keys = mapping[1]
  local func = mapping[2]
  local mode = mapping.mode or "n"

  local opts = vim.tbl_deep_extend("force", default_opts, global_opts or {})
  for key, value in pairs(mapping) do
    if key ~= 1 and key ~= 2 and key ~= "mode" then
      opts[key] = value
    end
  end

  vim.keymap.set(mode, keys, func, opts)
end

---@param mapping Mapping|Mapping[]
---@param global_opts? vim.keymap.set.Opts
return function(mapping, global_opts)
  if #mapping > 0 and type(mapping[1]) == "table" then
    ---@cast mapping Mapping[]
    for _, map in ipairs(mapping) do
      set(map, global_opts)
    end
  elseif type(mapping) == "table" then
    set(mapping, global_opts)
  else
    error "Parameter mapping must be a table or an array of tables"
  end
end
