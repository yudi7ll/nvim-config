local map = require "utils.map"
local Path = require("plenary").path

local db_path = Path:new(vim.fn.stdpath "data" .. "/static-buffers.json")
local project_id = vim.fn.getcwd()
local cached_db_data = nil

local db_data = function()
  if cached_db_data then
    return cached_db_data
  end

  cached_db_data = vim.fn.json_decode(db_path:read())

  return cached_db_data
end

local M = {}

---@param bufnr number
M.get_buffer_name = function(bufnr)
  if type(bufnr) ~= "number" or bufnr <= 0 then
    return nil
  end

  local bufname = vim.api.nvim_buf_get_name(bufnr):gsub("^" .. vim.pesc(project_id) .. "/?", "")
  return vim.fn.fnameescape(bufname)
end

M.get_all = function()
  return db_data()[project_id] or {}
end

M.save_current_buffer = function()
  local bufnr = vim.api.nvim_get_current_buf()
  local buffer_name = M.get_buffer_name(bufnr)
  local project_data = M.get_all()

  if
    not buffer_name
    or vim.api.nvim_get_option_value("buftype", { buf = bufnr }) ~= ""
    or project_data[buffer_name]
  then
    return false
  end

  project_data[buffer_name] = {
    mark = vim.api.nvim_win_get_cursor(0),
  }

  local result = vim.tbl_deep_extend("force", db_data(), { [project_id] = project_data })

  db_path:write(vim.fn.json_encode(result), "w")
  print("Saved " .. buffer_name)

  cached_db_data = nil
  return true
end

M.load = function()
  local project_data = M.get_all()

  if type(project_data) ~= "table" then
    return false
  end

  for cached_bufname, data in pairs(project_data) do
    if vim.fn.bufexists(cached_bufname) then
      vim.cmd("badd " .. vim.fn.fnameescape(cached_bufname))

      local bufnr = vim.fn.bufnr(cached_bufname)
      if bufnr > 0 and type(data.mark) == "table" then
        if not vim.api.nvim_buf_is_loaded(bufnr) then
          vim.fn.bufload(bufnr)
        end

        if data.mark and #data.mark == 2 then
          local row, col = unpack(data.mark)
          vim.api.nvim_buf_set_mark(bufnr, "'", row, col, {})
        end
      end
      print(vim.fn.fnameescape(cached_bufname) .. " loaded")
    end
  end
end

M.remove = function()
  local bufnr = vim.api.nvim_get_current_buf()
  local buffer_name = M.get_buffer_name(bufnr)
  local project_data = M.get_all()
  local new_project_data = {}

  if type(project_data) ~= "table" then
    return false
  end

  for c_bufname, cursor_data in pairs(project_data) do
    if c_bufname ~= buffer_name then
      new_project_data[c_bufname] = cursor_data
    end
  end

  local result = vim.tbl_extend("force", db_data(), { [project_id] = new_project_data })

  db_path:write(vim.fn.json_encode(result), "w")
  print("Removed " .. buffer_name)
  cached_db_data = nil
end

M.toggle = function()
  if not M.save_current_buffer() then
    M.remove()
  end
end

M.is_pinned = function(buffer_name)
  local bufnr = vim.api.nvim_get_current_buf()
  local buffer_name = M.get_buffer_name(bufnr)

  -- if lists[project_root][buffer_name] == true then
  -- end
end

M.setup = function()
  if not db_path:exists() or type(db_data()) ~= "table" then
    db_path:write(vim.fn.json_encode {}, "w")
  end

  -- local load_buffers = vim.api.nvim_create_augroup("StaticBufferLoad", { clear = true })
  -- vim.api.nvim_create_autocmd({ "BufReadPre" }, {
  --   callback = M.load,
  --   group = load_buffers,
  -- })

  -- local jump_to_mark = vim.api.nvim_create_augroup("StaticBufferJumpToMark", { clear = true })
  -- vim.api.nvim_create_autocmd({ "BufReadPre" }, {
  --   callback = function(args)
  --     local bufnr = vim.api.nvim_get_current_buf()
  --
  --     local mark = vim.api.nvim_buf_get_mark(bufnr, "'")
  --     if mark[1] > 0 then
  --       vim.cmd "normal! g`'"
  --     end
  --   end,
  --   group = jump_to_mark,
  -- })

  -- local buf_leave = vim.api.nvim_create_augroup("StaticBufferLeave", { clear = true })
  -- vim.api.nvim_create_autocmd({ "BufLeave" }, {
  --   callback = function(args)
  --     local bufnr = args.buf
  --   end,
  -- })
  -- M.load()

  map {
    { "<c-t>", M.toggle, desc = "Static Buffers | Toggle" },
    { "<localleader>et", M.toggle, desc = "Static Buffers | Toggle" },
    { "<localleader>el", M.load, desc = "Static Buffers | Load" },
    -- { "<a-d>", M.remove, desc = "Static Buffers | Remove" },
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
