---@type LazySpec
return {
  enabled = false,
  "VidocqH/lsp-lens.nvim",
  event = "BufReadPost",
  opts = {
    enable = true,
    include_declaration = false, -- Reference include declaration
    sections = { -- Enable / Disable specific request, formatter example looks 'Format Requests'
      definition = false,
      references = true,
      implements = true,
      git_authors = true,
    },
    ignore_filetype = {
      "prisma",
    },
  },
}
