---@type LazySpec
return {
  enabled = false,
  "ggandor/leap.nvim",
  event = "BufReadPost",
  config = function()
    require("leap").add_default_mappings()
  end,
}
