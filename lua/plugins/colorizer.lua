---@type LazySpec
return {
  enabled = false,
  "norcalli/nvim-colorizer.lua",
  event = "BufReadPost",
  config = function()
    require("colorizer").setup()
  end,
}
