---@type NvPluginSpec
return {
  "klen/nvim-config-local",
  event = "BufReadPre",
  opts = {
    lookup_parents = true,
  },
  config = true,
}
