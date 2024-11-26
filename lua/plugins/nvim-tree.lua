---@type NvPluginSpec

local function on_attach(bufnr)
  local api = require "nvim-tree.api"

  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  -- default mappings
  api.config.mappings.default_on_attach(bufnr)

  -- custom mappings
  vim.keymap.set("n", "?", api.tree.toggle_help, opts "Help")
  vim.keymap.set("n", "l", api.node.open.edit, opts "Help")
  vim.keymap.set("n", "h", api.tree.collapse_all, opts "Help")
  vim.keymap.set("n", "d", api.fs.trash, opts "Help")
end

return {
  "nvim-tree/nvim-tree.lua",
  enabled = false,
  cmd = { "NvimTreeToggle", "NvimTreeFocus" },
  opts = {
    on_attach = on_attach,
    filters = { dotfiles = true },
    disable_netrw = true,
    hijack_cursor = false,
    sync_root_with_cwd = true,
    update_focused_file = {
      enable = true,
      update_root = false,
    },
    view = {
      side = "left",
      width = 40,
      preserve_window_proportions = true,
    },
    renderer = {
      root_folder_label = ":t",
      highlight_git = true,
      indent_markers = { enable = true },
      icons = {
        glyphs = {
          default = "󰈚",
          folder = {
            default = "",
            empty = "",
            empty_open = "",
            open = "",
            symlink = "",
          },
          git = { unmerged = "" },
        },
      },
    },
  },
}
