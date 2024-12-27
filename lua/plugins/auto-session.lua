---@type LazySpec
return {
  enabled = false,
  "rmagatti/auto-session",
  event = "BufReadPre",
  keys = {
    { "<leader>wr", "<cmd>SessionRestore<CR>", desc = "Session | Session restore" },
    { "<leader>ws", "<cmd>SessionSave<CR>", desc = "Session | Save session" },
    { "<leader>wa", "<cmd>SessionToggleAutoSave<CR>", desc = "Session | Toggle autosave" },
    { "<leader>wd", "<cmd>SessionDelete<cr>", desc = "Session | Delete" },
    { "<leader>wf", "<cmd>SessionSearch<cr>", desc = "Session | Search" },
  },
  config = function()
    vim.o.sessionoptions = "buffers,curdir,folds,help,tabpages,winsize,winpos"
    require("auto-session").setup {
      use_git_branch = false,
      bypass_save_filetypes = { "", "alpha", "checkhealth" },
      auto_restore = false,
    }
  end,
}
