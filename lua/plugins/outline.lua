-- @type LazySpec
return {
  enabled = false,
  "hedyhli/outline.nvim",
  cmd = { "Outline", "OutlineOpen" },
  keys = {
    { "<leader>oo", "<cmd>Outline<CR>", desc = "Toggle outline" },
  },
  config = true,
}
