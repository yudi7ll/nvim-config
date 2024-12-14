---@class Map
---@field [1] string lhs
---@field [2] string|function rhs
---@field mode? string|string[]
---@field noremap? boolean
---@field nowait? boolean
---@field silent? boolean
---@field script? boolean
---@field expr? boolean
---@field unique? boolean
---@field callback? function
---@field desc? string
---@field replace_keycodes? boolean

---@type vim.keymap.set.Opts
local default_opts = {
  silent = true,
  noremap = true,
}

---@param mapping Map
local set = function(mapping)
  if type(mapping) ~= "table" then
    error "Parameter mapping must be a table"
  end
  local keys = mapping[1]
  local func = mapping[2]
  local mode = mapping.mode or "n" -- Default to "n" (normal mode)

  local opts = default_opts
  for key, value in pairs(mapping) do
    if key ~= 1 and key ~= 2 and key ~= "mode" then
      opts[key] = value
    end
  end

  vim.keymap.set(mode, keys, func, opts)
end

---@param mapping Map|Map[]
return function(mapping)
  if type(mapping) == "table" and #mapping > 0 then
    for _, map in ipairs(mapping) do
      set(map)
    end
  elseif type(mapping) == "table" then
    set(mapping)
  else
    error "Parameter mapping must be a table or an array of tables"
  end
end
