local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  execute('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
  execute 'packadd packer.nvim'
end

vim.cmd [[packadd packer.nvim]]
vim.cmd 'autocmd BufWritePost plugins.lua PackerCompile' -- Auto compile when there are changes in plugins.lua

return require('packer').startup(function(use)
  use {'wbthomason/packer.nvim', opt = true}

  -- colorscheme
  use {'sjl/badwolf'}
  use {'morhetz/gruvbox'}
  use {'ghifarit53/tokyonight-vim'}

  -- LSP
  use {'neovim/nvim-lspconfig'}
  use {'glepnir/lspsaga.nvim', config = function () require('lspsaga').init_lsp_saga() end}
  use {'onsails/lspkind-nvim', config = function () require('lspkind').init() end}
  use {'kosayoda/nvim-lightbulb'}
  use {'hrsh7th/vim-vsnip'}
  use {'hrsh7th/vim-vsnip-integ'}

  -- Autocomplete
  use {'hrsh7th/nvim-compe'}

  -- Tree Sitter
  use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate', branch = 'master'}

  -- General
  use {'kyazdani42/nvim-web-devicons'}
  use {'windwp/nvim-autopairs', config = function() require('nvim-autopairs').setup() end}
  use {'andweeb/presence.nvim'}
  use {'kyazdani42/nvim-tree.lua'}
  use {'mattn/emmet-vim'}
  use {'norcalli/nvim-colorizer.lua', config = function() require'colorizer'.setup() end}
  use {'glepnir/galaxyline.nvim', branch = 'main'}
  use {'terrortylor/nvim-comment', config = function () require('nvim_comment').setup() end}
  use {'tpope/vim-surround'}
  use {'tpope/vim-fugitive'}
  use {'airblade/vim-gitgutter'}
  use {'editorconfig/editorconfig-vim'}
  use {'Yggdroot/indentLine'}
  use {'tommcdo/vim-lion'}
  use {'nelstrom/vim-visual-star-search'}
  use {'antoinemadec/FixCursorHold.nvim'}
  use {'sheerun/vim-polyglot'}
  use {'akinsho/nvim-bufferline.lua'}
end)
