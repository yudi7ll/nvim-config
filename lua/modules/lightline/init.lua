vim.g.lightline = {
  colorscheme = 'tokyonight',
  active = {
    left = {
      { 'mode', 'paste' },
      { 'ctrlpmark','gitbranch', 'git', 'diagnostic', 'filename', 'method', 'readonly', 'modified' }
    },
    right = {
      { 'filetype', 'lineinfo', 'percent' },
    }
  },
  component_function = {
    gitbranch = 'FugitiveHead'
  }
}
