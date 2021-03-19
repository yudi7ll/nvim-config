local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  execute('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
  execute 'packadd packer.nvim'
end

-- Only required if you have packer in your `opt` pack
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
  -- Packer can manage itself as an optional plugin
  use {'wbthomason/packer.nvim', opt = true}
  use {'sjl/badwolf'}
  use {'morhetz/gruvbox'}
  use {'ghifarit53/tokyonight-vim'}
  use {'itchyny/lightline.vim'}
  use {'mengelbrecht/lightline-bufferline'}

  use {'tomtom/tcomment_vim'}
  use {'tpope/vim-surround'}
  use {'tpope/vim-fugitive'}
  use {'editorconfig/editorconfig-vim'}
  use {'Yggdroot/indentLine'}
  -- use {'tommcdo/vim-lion'}
  use {'nelstrom/vim-visual-star-search'}
  -- use {'chaoren/vim-wordmotion'}
  -- use {'lambdalisue/nerdfont.vim'}
  -- use {'lambdalisue/fern.vim'}
  -- use {'lambdalisue/fern-git-status.vim'}
  -- use {'lambdalisue/fern-renderer-nerdfont.vim'}
  -- use {'lambdalisue/fern-hijack.vim'}
  use {'antoinemadec/FixCursorHold.nvim'}
  use {'sheerun/vim-polyglot'}
  -- use {'jackguo380/vim-lsp-cxx-highlight'}
  -- use {'ervandew/supertab'}
  -- use {'dense-analysis/ale'}
  -- use {'tobyS/vmustache'}
  -- use {'tobyS/pdv'}
  -- use {'sumpygump/php-documentor-vim'}
  -- use {'jwalton512/vim-blade'}
  use {
    'neovim/nvim-lspconfig',
    requires = {
      {
        'glepnir/lspsaga.nvim',
        config = function () require('lspsaga').init_lsp_saga() end
      }
    }
  }
  use {'hrsh7th/nvim-compe'}
  use {
    'windwp/nvim-autopairs',
    config = function() require('nvim-autopairs').setup() end
  }
  -- use {'andweeb/presence.nvim'}
  use {
    'kyazdani42/nvim-tree.lua',
    requires = {'kyazdani42/nvim-web-devicons'}
  }
  use {'mattn/emmet-vim'}
end)
