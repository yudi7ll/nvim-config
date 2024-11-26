---@type NvPluginSpec
return {
  {
    "nvim-lua/plenary.nvim",
  },
  { "b0o/schemastore.nvim" },
  {
    "moll/vim-bbye",
    cmd = { "Bdelete", "Bwipeout" },
  },
  -- Add Luarocks support for lazy.nvim
  {
    "vhyrro/luarocks.nvim",
    priority = 1000,
    config = true,
  },
}
