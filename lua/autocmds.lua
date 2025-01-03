local au = require "utils.au"
local map = require "utils.map"

au("FileType", "qf", function(args)
  local bufnr = args.buf
  map({
    { "q", "<cmd>:q<cr>", desc = "Close quickfix window" },
    { "<esc>", "<cmd>:q<cr>", desc = "Close quickfix window" },
  }, { buffer = bufnr })
end, "Close quickfix window")

--[[ local auto_change_root = vim.api.nvim_create_augroup("AutoChRoot", { clear = true })
vim.api.nvim_create_autocmd("BufEnter", {
  group = auto_change_root,
  callback = function()
    local root_names = { "package.json", "Makefile", ".git" }
    local root_cache = {}
    local path = vim.api.nvim_buf_get_name(0)
    if path == "" then
      return
    end
    path = vim.fs.dirname(path)

    local root = root_cache[path]
    if root == nil then
      local root_file = vim.fs.find(root_names, { path = path, upward = true })[1]
      if root_file == nil then
        return
      end
      root = vim.fs.dirname(root_file)
      root_cache[path] = root
    end

    vim.fn.chdir(root)
    -- print("Project root changed to " .. root)
  end,
}) ]]
