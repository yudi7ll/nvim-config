---@type LazySpec
return {
  "sindrets/diffview.nvim",
  event = "BufReadPost",
  keys = {
    {
      '<leader>gg',
      function()
        if next(require("diffview.lib").views) == nil then
          vim.cmd "DiffviewOpen"
        else
          vim.cmd "DiffviewClose"
        end
      end,
      desc = "Diffview | Toggle Diffview"
    }
  },
  cmd = { "DiffviewOpen", "DiffviewClose" },
}
