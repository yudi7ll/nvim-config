---@type LazySpec
return {
  "folke/persistence.nvim",
  event = "BufReadPre",
  keys = {
    {
      "<leader>wr",
      function()
        require("persistence").load()
      end,
      desc = "Persistence | Restore session",
    },
    {
      "<leader>wf",
      function()
        require("persistence").select()
      end,
      desc = "Persistence | Select session",
    },
    {
      "<leader>wd",
      function()
        require("persistence").stop()
      end,
      desc = "Persistence | Don't save on exit",
    },
  },
  init = function()
    vim.o.sessionoptions = "buffers,curdir,folds,help,tabpages,winsize,winpos"
  end,
  config = true,
}
