---@type LazySpec
return {
  "folke/lazydev.nvim",
  ft = "lua",               -- only load on lua files
  dependencies = {
    "Bilal2453/luvit-meta", -- optional `vim.uv` typings
  },
  opts = {
    library = {
      -- Library items can be absolute paths
      -- "~/projects/my-awesome-lib",
      -- Or relative, which means they will be resolved as a plugin
      -- When relative, you can also provide a path to the library in the plugin dir
      "luvit-meta/library", -- see below
    },
  },
}
