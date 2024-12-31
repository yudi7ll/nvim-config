local map = require "utils.map"
local Path = require("plenary").path

local db_path = Path:new(vim.fn.stdpath "data" .. "/static-buffers.json")
local project_id = vim.fn.getcwd()

local db_data = function()
  return vim.json.decode(db_path:read()) or {}
end

local M = {}

M.get_buffer_name = function(bufnr)
  if bufnr == nil then
    return ""
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

  if vim.api.nvim_get_option_value("buftype", { buf = bufnr }) ~= "" then
    return false
  end

  if project_data[buffer_name] then
    return false
  end

  project_data[buffer_name] = {
    mark = vim.api.nvim_win_get_cursor(0),
  }

  local result = vim.tbl_deep_extend("force", db_data(), { [project_id] = project_data })

  db_path:write(vim.json.encode(result), "w")
  print("Saved " .. buffer_name)

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

  if type(project_data) ~= "table" then
    return
  end

  project_data[buffer_name] = nil

  db_path:write(vim.json.encode(db_data()), "w")
  -- vim.cmd "bd"
  -- vim.cmd "BufferLineCyclePrev"
  print("Removed " .. buffer_name)
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
    db_path:write(vim.json.encode {}, "w")
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
