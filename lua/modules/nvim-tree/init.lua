local utils = require('common.utils')
local nmap = utils.nmap

nmap('<C-n>', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
nmap('<C-f>', ':NvimTreeFindFile<CR>', { noremap = true, silent = true })

vim.g.nvim_tree_highlight_opened_files = 1
vim.g.nvim_tree_hide_dotfiles          = 1
vim.g.nvim_tree_indent_markers         = 0
vim.g.nvim_tree_disable_window_picker  = 1
vim.g.nvim_tree_refresh_wait           = 500
vim.g.nvim_tree_icons = {
  default = '',
  symlink = '',
  git = {
    unstaged  = "",
    staged    = "",
    unmerged  = "",
    renamed   = "➜",
    untracked = ""
  },
  folder = {
    default      = "",
    open         = "",
    empty        = "",
    empty_open   = "",
    symlink      = "",
    symlink_open = "",
  },
  lsp = {
    hint    = "",
    info    = "",
    warning = "",
    error   = "",
  }
}

local tree_cb = require'nvim-tree.config'.nvim_tree_callback
local list = {
  { key = "l",         cb = tree_cb('edit') },
  { key = "<CR>",      cb = tree_cb("cd") },
  { key = "v",         cb = tree_cb("vsplit") },
  { key = "s",         cb = tree_cb("split") },
  { key = "t",         cb = tree_cb("tabnew") },
  { key = "<BS>",      cb = tree_cb("close_node") },
  { key = "h",         cb = tree_cb("close_node") },
  { key = "<Tab>",     cb = tree_cb("preview") },
  { key = "I",         cb = tree_cb("toggle_ignored") },
  { key = "H",         cb = tree_cb("toggle_dotfiles") },
  { key = "R",         cb = tree_cb("refresh") },
  { key = "a",         cb = tree_cb("create") },
  { key = "d",         cb = tree_cb("remove") },
  { key = "r",         cb = tree_cb("rename") },
  { key = "<C-r>",     cb = tree_cb("full_rename") },
  { key = "x",         cb = tree_cb("cut") },
  { key = "c",         cb = tree_cb("copy") },
  { key = "p",         cb = tree_cb("paste") },
  { key = "[c",        cb = tree_cb("prev_git_item") },
  { key = "]c",        cb = tree_cb("next_git_item") },
  { key = "-",         cb = tree_cb("dir_up") },
  { key = "q",         cb = tree_cb("close") },
}

require("nvim-tree").setup({
  disable_netrw            = true,
  hijack_netrw             = true,
  open_on_setup            = false,
  ignore_ft_on_setup       = {},
  auto_close               = false,
  open_on_tab              = false,
  hijack_cursor            = false,
  update_cwd               = false,
  lsp_diagnostics          = true,
  root_folder_modifier     = false,
  update_focused_file = {
    enable      = true,
    update_cwd  = false,
    ignore_list = {}
  },

  system_open = {
    cmd  = nil,
    args = {}
  },

  view = {
    width       = 38,
    auto_resize = false,
    mappings = {
      custom_only = false,
      list        = list
    }
  },
})
