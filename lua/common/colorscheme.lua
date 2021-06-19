vim.cmd('colorscheme onedark')

vim.cmd([[
  hi Normal ctermbg=NONE guibg=NONE
  hi SignColumn guibg=NONE
  hi LineNr guibg=NONE
  hi CursorLine guibg=#1c1e25
  hi CursorLineNr guibg=NONE
  hi ColorColumn guibg=#181a20
]])

vim.g.onedark_style = 'darker'
