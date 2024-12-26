local map = require "custom.map"

local json_to_jsonc = vim.api.nvim_create_augroup("JsonToJsonc", { clear = true })
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "json" },
  command = "set filetype=jsonc",
  group = json_to_jsonc,
})

local env_to_sh = vim.api.nvim_create_augroup("EnvToSh", { clear = true })
vim.api.nvim_create_autocmd({ "BufRead" }, {
  pattern = ".env.*",
  command = "set filetype=sh",
  group = env_to_sh,
})

local qf_quit = vim.api.nvim_create_augroup("QfQuit", { clear = true })
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = "qf",
  callback = function(args)
    local bufnr = args.buf
    map({
      { "q", "<cmd>:q<cr>", desc = "Close quickfix window" },
      { "<esc>", "<cmd>:q<cr>", desc = "Close quickfix window" },
    }, { buffer = bufnr })
  end,
  group = qf_quit,
})

local auto_change_root = vim.api.nvim_create_augroup("AutoChRoot", { clear = true })
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
})
