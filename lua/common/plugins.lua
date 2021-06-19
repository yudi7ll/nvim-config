-- Bootstrap
local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  execute('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
  execute 'packadd packer.nvim'
end

execute [[packadd packer.nvim]]

require('packer').init({
  git = { clone_timeout = 9999 }
})

return require('packer').startup(function(use)
  use {'wbthomason/packer.nvim', opt = true}

  -- colorscheme
  use {'ChristianChiarulli/nvcode-color-schemes.vim'}
  use {'navarasu/onedark.nvim'}

  use {
    'neoclide/coc.nvim', branch = 'release',
    config = [[require('modules.coc')]]
  }

  -- Icons
  use {
    'kyazdani42/nvim-web-devicons',
    config = [[require('modules.nvim-web-devicons')]]
  }

  -- General
  use {'jiangmiao/auto-pairs'}
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
    config = [[require('modules.nvim-comment')]]
  }
  use {'tpope/vim-surround'}
  use {'tpope/vim-sleuth'}
  use {
    'lewis6991/gitsigns.nvim',
    requires = {
      'nvim-lua/plenary.nvim'
    },
    config = [[require('modules.gitsigns')]]
  }
  use {'editorconfig/editorconfig-vim'}
  use {'tommcdo/vim-lion', opt = true, ft = 'lua'}
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
  use {
    'nvim-treesitter/nvim-treesitter', run = ':TSUpdate',
    config = [[require('modules.treesitter')]]
  }
  use {
    'andweeb/presence.nvim',
    config = [[require('presence')]]
  }

  -- Highlighting
  use {
    'jwalton512/vim-blade', opt = true, ft = 'blade',
    config = [[require('modules.vim-blade')]]
  }
  use {'nikvdp/ejs-syntax', opt = true, ft = 'ejs'}
  use {'chr4/nginx.vim', opt = true, ft = 'nginx'}
end)
