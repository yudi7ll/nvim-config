require("modules.nvim-lsputils.handlers").setup()

require("cosmic-ui").setup({
  border_style = "single",
  rename = {
    border = {
      highlight = "NormalFloat",
      style = nil,
      title = " Rename ",
      title_align = "left",
      title_hl = "NormalFloat",
    },
    prompt = "> ",
    prompt_hl = "Comment",
  },
  code_actions = {
    min_width = nil,
    border = {
      bottom_hl = "NormalFloat",
      highlight = "NormalFloat",
      style = nil,
      title = "Code Actions",
      title_align = "center",
      title_hl = "NormalFloat",
    },
  },
})

local border_chars = {
  TOP_LEFT = "┌",
  TOP_RIGHT = "┐",
  MID_HORIZONTAL = "─",
  MID_VERTICAL = "│",
  BOTTOM_LEFT = "└",
  BOTTOM_RIGHT = "┘",
}
vim.g.lsp_utils_location_opts = {
  height = 24,
  mode = "split",
  preview = {
    title = "Location Preview",
    numbering = true,
    border = true,
    border_chars = border_chars,
    highlight = "NormalFloat",
    preview_highlight = "NormalFloat",
  },
}
