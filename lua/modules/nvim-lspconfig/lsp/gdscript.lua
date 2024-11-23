local lspconfig = require("lspconfig")
local configs = require("modules.nvim-lspconfig.configs")
local pipe = "/tmp/godot.pipe"

lspconfig.gdscript.setup(vim.tbl_deep_extend("force", configs, {
  name = "Godot",
  root_dir = vim.fs.dirname(vim.fs.find({ "project.godot", ".git" }, { upward = true })[1]),
  on_attach = function(client, bufnr)
    configs.on_attach(client, bufnr)
    vim.api.nvim_command('echo serverstart("' .. pipe .. '")')
  end,
}))
