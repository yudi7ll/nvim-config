local map = require "utils.map"
local Path = require("plenary").path

local db_path = Path:new(vim.fn.stdpath "data" .. "/static-buffers.json")
local project_root = vim.fn.getcwd()

local M = {}

M.get_buffer_name = function(bufnr)
  if bufnr == nil then
    return ""
  end
  return vim.api.nvim_buf_get_name(bufnr):gsub("^" .. vim.pesc(project_root) .. "/?", "")
end

M.get_all = function()
  local db_data = vim.json.decode(db_path:read())
  local project_data = db_data[project_root]

  if type(project_data) ~= "table" then
    return {}
  end

  return project_data
end

M.save_current_buffer = function()
  local bufnr = vim.api.nvim_get_current_buf()
  local buffer_name = M.get_buffer_name(bufnr)
  local db_data = vim.json.decode(db_path:read())
  local project_data = db_data[project_root] or {}

  if vim.api.nvim_get_option_value("buftype", { buf = bufnr }) ~= "" then
    return
  end

  for _, data in ipairs(project_data) do
    if data.name == buffer_name then
      return
    end
  end

  table.insert(project_data, {
    id = bufnr,
    name = buffer_name,
  })

  local result = vim.tbl_deep_extend("force", db_data, { [project_root] = project_data })

  db_path:write(vim.json.encode(result), "w")
  print("Saved " .. buffer_name)
end

M.load = function()
  local db_data = vim.json.decode(db_path:read())
  local project_data = db_data[project_root]

  if type(project_data) ~= "table" then
    return
  end

  for _, data in ipairs(project_data) do
    vim.cmd("badd " .. vim.fn.fnameescape(data.name))
    print(data.name .. " loaded")
  end
end

M.remove = function()
  local bufnr = vim.api.nvim_get_current_buf()
  local buffer_name = M.get_buffer_name(bufnr)
  local db_data = vim.json.decode(db_path:read())
  local project_data = db_data[project_root]

  if type(project_data) ~= "table" then
    return
  end

  for i, data in ipairs(project_data) do
    if data.name == buffer_name then
      table.remove(project_data, i)
    end
  end

  db_path:write(vim.json.encode(db_data), "w")
  -- vim.cmd "bd"
  -- vim.cmd "BufferLineCyclePrev"
  print("Removed " .. buffer_name)
end

M.setup = function()
  if not db_path:exists() then
    db_path:write(vim.json.encode {}, "w")
  end

  -- local load_buffers = vim.api.nvim_create_augroup("StaticBufferLoad", { clear = true })
  -- vim.api.nvim_create_autocmd({ "BufReadPost" }, {
  --   callback = M.load,
  --   group = load_buffers,
  -- })

  M.load()

  map {
    { "<localleader>xs", M.save_current_buffer, desc = "Static Buffers | Save Current" },
    { "<localleader>xl", M.load, desc = "Static Buffers | Load" },
    { "<localleader>xd", M.remove, desc = "Static Buffers | Remove" },
  }
end

M.setup()
-- M.save_current()
-- M.load()
-- M.remove()

return M
