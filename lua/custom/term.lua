local M = {}

M.buf = nil
M.win = nil
M.mode = "t"

function M.toggle()
  if M.win and vim.api.nvim_win_is_valid(M.win) then
    M.mode = vim.fn.mode()
    print(M.mode)
    vim.api.nvim_win_close(M.win, true)
    M.win = nil
  else
    M.open()
  end
end

function M.open()
  if not M.buf or not vim.api.nvim_buf_is_valid(M.buf) then
    M.buf = vim.api.nvim_create_buf(false, true)

    vim.api.nvim_set_option_value("bufhidden", "hide", { buf = M.buf })
    vim.api.nvim_set_option_value("swapfile", false, { buf = M.buf })
  end

  local width = vim.o.columns
  local height = vim.o.lines

  local win_width = math.ceil(width * 0.9)
  local win_height = math.ceil(height * 0.8)
  local col = math.ceil((width - win_width) / 2) - 1
  local row = math.ceil((height - win_height) / 2) - 1

  M.win = vim.api.nvim_open_win(M.buf, true, {
    relative = "editor",
    width = win_width,
    height = win_height,
    col = col,
    row = row,
    style = "minimal",
    border = "rounded",
    title = "Terminal",
  })

  if vim.fn.bufname(M.buf) == "" then
    vim.fn.termopen(vim.o.shell)
  end

  if M.mode == "t" then
    vim.cmd "startinsert"
  end
end

function M.setup()
  local map = require "custom.map"
  map { "<leader>t", M.toggle, desc = "Toggle Terminal", nowait = true, mode = { "n", "t" } }
end

-- M.setup()
-- M.toggle()

return M
