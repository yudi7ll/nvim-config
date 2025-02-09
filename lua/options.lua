vim.filetype.add {
  filename = {
    [".env"] = "sh",
    [".envrc"] = "sh",
  },
  extension = {
    ["json"] = "jsonc",
  },
  pattern = {
    ["*.env.*"] = "sh",
  },
}

vim.g.format_on_save = false
vim.g.mapleader = " "
vim.g.maplocalleader = ","
vim.g.start_time = vim.loop.hrtime()

vim.o.background = "dark"
vim.o.cmdheight = 2

vim.opt.autoindent = true
vim.opt.backspace = "indent,eol,start"
vim.opt.backup = false
-- vim.opt.colorcolumn = "80"
vim.opt.compatible = false
vim.opt.completeopt = "menu,menuone,noinsert"
vim.opt.cursorline = true
vim.opt.encoding = "UTF-8"
vim.opt.expandtab = true
vim.opt.hidden = true
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.laststatus = 2
vim.opt.lazyredraw = false
vim.opt.mouse = ""
vim.opt.fixeol = false
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.shell = "/bin/zsh"
vim.opt.smartcase = true
vim.opt.smartindent = true
vim.opt.smarttab = true
vim.opt.shiftwidth = 2
vim.opt.shiftround = false
vim.opt.showtabline = 2
vim.opt.signcolumn = "yes"
vim.opt.sidescrolloff = 12
vim.opt.scrolloff = 12
vim.opt.showmode = false
vim.opt.softtabstop = 2
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.tabstop = 2
vim.opt.termguicolors = true
vim.opt.textwidth = 0
vim.opt.undofile = true
vim.opt.updatetime = 100
vim.opt.timeoutlen = 300
vim.opt.title = true
vim.opt.titlestring = vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
vim.opt.wildignorecase = true
vim.opt.wildmode = "longest,full"
vim.opt.wildmenu = true
vim.opt.wrap = false
vim.opt.writebackup = false
vim.opt.clipboard:append "unnamedplus"
vim.opt.shortmess:append "c"
vim.opt.iskeyword:append { "#" }
