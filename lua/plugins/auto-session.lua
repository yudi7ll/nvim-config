---@type LazySpec
return {
  "rmagatti/auto-session",
  lazy = false,
  keys = {
    -- Will use Telescope if installed or a vim.ui.select picker otherwise
    { "<leader>wr", "<cmd>SessionRestore<CR>", desc = "Auto Session | Session restore" },
    { "<leader>ws", "<cmd>SessionSave<CR>", desc = "Auto Session | Save session" },
    { "<leader>wa", "<cmd>SessionToggleAutoSave<CR>", desc = "Auto Session | Toggle autosave" },
    { "<leader>wd", "<cmd>SessionDelete<cr>", desc = "Auto Session | Delete" },
    { "<leader>wf", "<cmd>SessionSearch<cr>", desc = "Auto Session | Search" },
  },
  config = function()
    vim.o.sessionoptions = "buffers,curdir,folds,help,tabpages,winsize,winpos"
    require("auto-session").setup {
      use_git_branch = false,
      bypass_save_filetypes = { "alpha" },
      auto_restore = false,
    }
  end,
}
