require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true
  }
}

vim.g.python2_host_prog = '/usr/bin/python2'
vim.g.python3_host_prog = '/usr/bin/python3'

-- cursorhold
vim.g.cursorhold_updatetime = 100

-- FZF Exclude modules,vendor,etc
vim.cmd('let $FZF_DEFAULT_COMMAND = 'ag -g ""')
