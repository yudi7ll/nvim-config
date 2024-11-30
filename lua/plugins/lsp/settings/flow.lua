-- forget it, typescript win
local lspconfig = require "lspconfig"
local function get_flow_cmd()
  -- Read .flowconfig and extract the version
  local flowconfig = vim.fn.findfile(".flowconfig", ".;")
  if flowconfig == "" then
    return nil
  end
  local version = vim.fn.system("grep -A 1 '^\\[version\\]' " .. flowconfig .. " | tail -n 1")
  version = vim.fn.trim(version)

  if version == "" or not version then
    return { "npx", "flow-bin", "lsp" } -- fallback to latest Flow version
  else
    return { "npx", "flow-bin@" .. version, "lsp" } -- use specified Flow version
  end
end

return {
  default_config = {
    cmd = get_flow_cmd(),
    filetypes = { "javascript", "javascriptreact", "javascript.jsx" },
    root_dir = lspconfig.util.root_pattern ".flowconfig" or vim.fn.getcwd(),
  },
}
