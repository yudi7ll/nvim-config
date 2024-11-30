---@type LazySpec
return {
  'rmagatti/auto-session',
  lazy = false,
  keys = {
    -- Will use Telescope if installed or a vim.ui.select picker otherwise
    { '<leader>wr', '<cmd>SessionSearch<CR>',         desc = 'Auto Session | Session search' },
    { '<leader>ws', '<cmd>SessionSave<CR>',           desc = 'Auto Session | Save session' },
    { '<leader>wa', '<cmd>SessionToggleAutoSave<CR>', desc = 'Auto Session | Toggle autosave' },
    { "<leader>wd", "<cmd>SessionDelete<cr>",         desc = "Auto Session | Delete" }
  },

  ---enables autocomplete for opts
  ---@module "auto-session"
  ---@type AutoSession.Config
  opts = {
    suppressed_dirs = { '~/', '~/Projects', '~/Downloads', '/' },
    -- log_level = 'debug',
    bypass_save_filetypes = { '', 'neo-tree', 'alpha' },
    auto_restore = false,
  }
}
