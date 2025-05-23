local base = {
  base00 = "#1e222a",
  base01 = "#2d3139",
  -- base01 = "#2e3140",
  -- base01 = "#23272f",
  base02 = "#3e4451",
  base03 = "#545862",
  base04 = "#565c64",
  base05 = "#abb2bf",
  base06 = "#b6bdca",
  base07 = "#c8ccd4",
  base08 = "#e06c75",
  base09 = "#d19a66",
  base0A = "#e5c07b",
  base0B = "#98c379",
  base0C = "#56b6c2",
  base0D = "#61afef",
  base0E = "#c678dd",
  base0F = "#be5046",
}

return vim.tbl_extend("force", base, {
  border = base.base0E,
})
