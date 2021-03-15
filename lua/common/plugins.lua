-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer in your `opt` pack
vim.cmd [[packadd packer.nvim]]
-- Only if your version of Neovim doesn't have https://github.com/neovim/neovim/pull/12632 merged
-- vim._update_package_paths()

return require('packer').startup(function()
  -- Packer can manage itself as an optional plugin
  use {'wbthomason/packer.nvim', opt = true}
  use {'sjl/badwolf'}
  use {'ghifarit53/tokyonight-vim'}
  use {'itchyny/lightline.vim'}
  use {'mengelbrecht/lightline-bufferline'}

  use {'tomtom/tcomment_vim'}
  use {'tpope/vim-surround'}
  use {'tpope/vim-fugitive'}
  use {'editorconfig/editorconfig-vim'}
  -- use {'Yggdroot/indentLine'}
  -- use {'tommcdo/vim-lion'}
  use {'nelstrom/vim-visual-star-search'}
  -- use {'chaoren/vim-wordmotion'}
  -- use {'lambdalisue/nerdfont.vim'}
  -- use {'lambdalisue/fern.vim'}
  -- use {'lambdalisue/fern-git-status.vim'}
  -- use {'lambdalisue/fern-renderer-nerdfont.vim'}
  -- use {'lambdalisue/fern-hijack.vim'}
  use {'antoinemadec/FixCursorHold.nvim'}
  -- use {'sheerun/vim-polyglot'}
  -- use {'jackguo380/vim-lsp-cxx-highlight'}
  -- use {'ervandew/supertab'}
  -- use {'dense-analysis/ale'}
  -- use {'tobyS/vmustache'}
  -- use {'tobyS/pdv'}
  -- use {'sumpygump/php-documentor-vim'}
  -- use {'jwalton512/vim-blade'}
  use {'neovim/nvim-lspconfig'}
  use {
    'hrsh7th/nvim-compe',
    requires = {
      {'hrsh7th/vim-vsnip', opt = true},
      {'hrsh7th/vim-vsnip-integ', opt = true}
    }
  }
  use {
    'windwp/nvim-autopairs',
    config = function() require('nvim-autopairs').setup() end
  }
  use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
  use {'andweeb/presence.nvim'}
  use {
    'kyazdani42/nvim-tree.lua',
    requires = {'kyazdani42/nvim-web-devicons', opt = true}
  }
end)
