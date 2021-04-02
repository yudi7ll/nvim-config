vim.o.autoindent          = true
vim.o.background          = "dark"
vim.o.backup              = false
vim.o.clipboard           = "unnamedplus"
vim.o.cmdheight           = 2
vim.wo.colorcolumn        = "80"
vim.o.compatible          = false
vim.wo.cursorline         = true
vim.o.encoding            = "UTF-8"
vim.bo.expandtab          = true
vim.o.hidden              = true
vim.o.hlsearch            = true
vim.o.incsearch           = true
vim.o.ignorecase          = true
vim.o.laststatus          = 2
vim.o.mouse               = 'a'
vim.wo.number             = true
vim.wo.relativenumber     = true
vim.o.shell               = "/usr/bin/zsh"
vim.o.smartcase           = true
vim.bo.smartindent        = true
vim.o.smarttab            = true
vim.o.shiftwidth          = 2
vim.o.showtabline         = 2
vim.wo.signcolumn         = "yes"
vim.o.sidescrolloff       = 8
vim.o.scrolloff           = 8
vim.o.showmode            = false
vim.o.softtabstop         = 2
vim.o.tabstop             = 2
vim.o.termguicolors       = true
vim.o.textwidth           = 0
vim.o.undofile            = true
vim.o.undodir             = "/hdd/.cache/nvim/undodir"
vim.o.updatetime          = 300
vim.o.timeoutlen          = 500
vim.o.title               = true
vim.o.t_Co                = "256"
vim.o.wildignorecase      = true
vim.o.wildmode            = "longest,full"
vim.o.wildmenu            = true
vim.wo.wrap               = false
vim.o.writebackup         = false

vim.cmd('au CursorHold * checktime')
vim.cmd('set shortmess+=c')
vim.cmd('set whichwrap+=<,>,[,]')
vim.cmd('syntax enable')
vim.cmd('filetype plugin indent on')
vim.cmd('colorscheme badwolf')
