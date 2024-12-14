---@type LazySpec
return {
  "akinsho/git-conflict.nvim",
  version = "*",
  event = "BufReadPost",
  cmd = {
    "GitConflictChooseOurs",
    "GitConflictChooseTheirs",
    "GitConflictChooseBoth",
    "GitConflictChooseNone",
    "GitConflictNextConflict",
    "GitConflictPrevConflict",
    "GitConflictListQf",
  },
  config = true,
}
