local lspconfig = require("lspconfig")
local lspconfig_configs = require("lspconfig.configs")
local configs = require("modules.nvim-lspconfig.configs")

local function get_flow_cmd()
  -- Read .flowconfig and extract the version
  local flowconfig = vim.fn.findfile(".flowconfig", ".;")
  if flowconfig == "" then
    return nil
  end
  local version = vim.fn.system("grep -A 1 '^\\[version\\]' " .. flowconfig .. " | tail -n 1")
  version = vim.fn.trim(version)

  if version == "" then
    return { "npx", "flow-bin", "lsp" } -- fallback to latest Flow version
  else
    return { "npx", "flow-bin@" .. version, "lsp" } -- use specified Flow version
  end
end

-- print(vim.inspect(get_flow_cmd()))

lspconfig_configs.flow = {
  default_config = {
    cmd = get_flow_cmd(),
    filetypes = { "javascript", "javascriptreact", "javascript.jsx" },
    root_dir = lspconfig.util.root_pattern(".flowconfig"),
  },
}

lspconfig.flow.setup(vim.tbl_deep_extend("force", configs, {}))
