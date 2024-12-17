local jsonToJsoncGroup = vim.api.nvim_create_augroup("JsonToJsonc", { clear = true })
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "json" },
  command = "set filetype=jsonc",
  group = jsonToJsoncGroup,
})

local envToSh = vim.api.nvim_create_augroup("EnvToSh", { clear = true })
vim.api.nvim_create_autocmd({ "BufRead" }, {
  pattern = ".env.*",
  command = "set filetype=sh",
  group = envToSh,
})

local logToConfig = vim.api.nvim_create_augroup("LogToConfig", { clear = true })
vim.api.nvim_create_autocmd({ "BufRead" }, {
  pattern = "*.log",
  command = "set filetype=config",
  group = logToConfig,
})

-- Array of file names indicating root directory. Modify to your liking.
local root_names = { "package.json", "Makefile", ".git" }

-- Cache to use for speed up (at cost of possibly outdated results)
local root_cache = {}

local set_root = function()
  -- Get directory path to start search from
  local path = vim.api.nvim_buf_get_name(0)
  if path == "" then
    return
  end
  path = vim.fs.dirname(path)

  -- Try cache and resort to searching upward for root directory
  local root = root_cache[path]
  if root == nil then
    local root_file = vim.fs.find(root_names, { path = path, upward = true })[1]
    if root_file == nil then
      return
    end
    root = vim.fs.dirname(root_file)
    root_cache[path] = root
  end

  -- Set current directory
  vim.fn.chdir(root)
  -- print("Project root changed to " .. root)
end

-- local root_augroup = vim.api.nvim_create_augroup("MyAutoRoot", {})
-- vim.api.nvim_create_autocmd("BufEnter", { group = root_augroup, callback = set_root })
