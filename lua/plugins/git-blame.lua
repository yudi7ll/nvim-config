---@type LazySpec
return {
  "f-person/git-blame.nvim",
  event = "BufReadPost",
  keys = {
    { "<leader>gbo", "<cmd>GitBlameOpenCommitURL<cr>", desc = "GitBlame | Open Commit Url" },
    { "<leader>gbc", "<cmd>GitBlameCopyCommitURL<cr>", desc = "GitBlame | Copy Commit Url" },
    { "<leader>gbf", "<cmd>GitBlameOpenFileURL<cr>", desc = "GitBlame | Open File Url" },
    { "<leader>gbC", "<cmd>GitBlameCopyFileURL<cr>", desc = "GitBlame | Copy File Url" },
  },
  cmd = {
    "GitBlameToggle",
    "GitBlameEnable",
    "GitBlameOpenCommitURL",
    "GitBlameCopyCommitURL",
    "GitBlameOpenFileURL",
    "GitBlameCopyFileURL",
    "GitBlameCopySHA",
  },
  opts = {
    enabled = true,
    display_virtual_text = false,
    message_template = " <author> • <summary> • <date>",
    date_format = "%b-%d-%Y",
    highlight_group = "GitSignsCurrentLineBlame",
    virtual_text_column = 40,
    delay = 300,
  },
}
