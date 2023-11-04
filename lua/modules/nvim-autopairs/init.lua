require("nvim-autopairs").setup({
  check_ts = true,
  enable_check_bracket_line = true, -- Don't add pairs if it already have a close pairs in same line
  disable_filetype = { "TelescopePrompt", "vim" }, --
  enable_afterquote = false, -- add bracket pairs after quote
  enable_moveright = true,
  map_cr = false,
})
