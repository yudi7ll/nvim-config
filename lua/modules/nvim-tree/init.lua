vim.api.nvim_set_keymap('n', '<C-n>', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('n', '<leader>r', ':NvimTreeRefresh<CR>', { noremap = true })
-- vim.api.nvim_set_keymap('n', '<leader>n', ':NvimTreeFindFile<CR>', { noremap = true })

vim.g.nvim_tree_width               = 38
vim.g.nvim_tree_indent_markers      = 1
vim.g.nvim_tree_git_hl              = 0
vim.g.nvim_tree_hijack_netrw        = 0
vim.g.nvim_tree_follow              = 1
vim.g.nvim_tree_hide_dotfiles       = 1

local tree_cb = require'nvim-tree.config'.nvim_tree_callback
vim.g.nvim_tree_bindings = {
  ["l"]              = tree_cb("edit"),
  ["<CR>"]           = tree_cb("cd"),
  ["v"]              = tree_cb("vsplit"),
  ["s"]              = tree_cb("split"),
  ["t"]              = tree_cb("tabnew"),
  ["<BS>"]           = tree_cb("close_node"),
  ["h"]              = tree_cb("close_node"),
  ["<Tab>"]          = tree_cb("preview"),
  ["I"]              = tree_cb("toggle_ignored"),
  ["H"]              = tree_cb("toggle_dotfiles"),
  ["R"]              = tree_cb("refresh"),
  ["a"]              = tree_cb("create"),
  ["d"]              = tree_cb("remove"),
  ["r"]              = tree_cb("rename"),
  ["<C-r>"]          = tree_cb("full_rename"),
  ["x"]              = tree_cb("cut"),
  ["c"]              = tree_cb("copy"),
  ["p"]              = tree_cb("paste"),
  ["[c"]             = tree_cb("prev_git_item"),
  ["]c"]             = tree_cb("next_git_item"),
  ["-"]              = tree_cb("dir_up"),
  ["q"]              = tree_cb("close"),
}
