---@type LazySpec
-- return {
--   enabled = false,
--   "numToStr/Comment.nvim",
--   event = "BufReadPost",
--   config = true,
-- }
return {
  "terrortylor/nvim-comment",
  event = "BufReadPost",
  config = function()
    require("nvim_comment").setup {
      comment_empty = false,
      -- hook = require("ts_context_commentstring.internal").update_commentstring,
    }
  end,
}
