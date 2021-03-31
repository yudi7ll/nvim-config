-- Bootstrap
local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  execute('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
end

-- Auto compile when there are changes in plugins.lua
vim.cmd 'autocmd BufWritePost plugins.lua PackerCompile'
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  use {'wbthomason/packer.nvim', opt = true}

  -- colorscheme
  use {'sjl/badwolf'}

  use {
  'neoclide/coc.nvim', branch = 'release',
  config = [[require('modules.coc')]]
}

  -- Icons
  use {
    'kyazdani42/nvim-web-devicons',
    config = [[require('modules.nvim-web-devicons')]]
  }
  use {'ryanoasis/vim-devicons'}

  -- General
  use {'sheerun/vimrc'}
  use {'jiangmiao/auto-pairs'}
  use {'junegunn/fzf', run = function() vim.fn['fzf#install']() end}
  use {'vijaymarupudi/nvim-fzf'}
  use {'andweeb/presence.nvim'}
  use {
    'kyazdani42/nvim-tree.lua',
    config = [[require('modules.nvim-tree')]]
  }
  use {
    'glepnir/galaxyline.nvim', branch = 'main',
    config = [[require('modules.galaxyline')]]
  }
  use {
    'terrortylor/nvim-comment',
    config = [[require('nvim_comment').setup()]]
  }
  use {'tpope/vim-surround'}
  use {'tpope/vim-fugitive'}
  use {'airblade/vim-gitgutter'}
  use {'editorconfig/editorconfig-vim'}
  use {
    'Yggdroot/indentLine',
    opt = true,
    config = [[require('modules.indentline')]],
  }
  use {'tommcdo/vim-lion', opt = true}
  use {
    'sheerun/vim-polyglot',
    config = [[require('modules.polyglot')]]
  }
 use {
   'akinsho/nvim-bufferline.lua',
   config = [[require('modules.bufferline')]]
 }
  use {
      'AckslD/nvim-whichkey-setup.lua',
      requires = {'liuchengxu/vim-which-key'},
      config = [[require('modules.vim-which-key')]]
  }
  use {
    'voldikss/vim-floaterm',
    config = [[require('modules.floaterm')]]
  }
  use {'liuchengxu/vista.vim'}
  use {
    'SirVer/ultisnips',
    requires = {'honza/vim-snippets'},
    config = [[require('modules.ultisnips')]]
  }
end)
