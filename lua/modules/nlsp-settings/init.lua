-- wip
require("nlspsettings").setup({
  local_settings_dir = ".vim",
  local_settings_root_markers_fallback = { ".git", ".vim" },
  append_default_schemas = true,
  loader = "json",
})
