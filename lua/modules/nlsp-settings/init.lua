require("nlspsettings").setup({
  config_home = vim.fn.stdpath("config") .. "/nlsp-settings",
  local_settings_dir = ".nvim",
  local_settings_root_markers_fallback = { ".git", ".nvim" },
  append_default_schemas = true,
  loader = "json",
})
