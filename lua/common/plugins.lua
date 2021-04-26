-- Bootstrap
local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  execute('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
  execute 'packadd packer.nvim'
end

-- Auto compile when there are changes in plugins.lua
vim.cmd 'autocmd BufWritePost plugins.lua PackerCompile'
require('packer').init({
  git = { clone_timeout = 9999 }
})

return require('packer').startup(function(use)
  use {'wbthomason/packer.nvim'}

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

  -- General
  use {'jiangmiao/auto-pairs'}
  -- use {'andweeb/presence.nvim'}
  -- use {
  --   'kyazdani42/nvim-tree.lua',
  --   config = [[require('modules.nvim-tree')]]
  -- }
  use {
    'glepnir/galaxyline.nvim', branch = 'main',
    config = [[require('modules.galaxyline')]]
  }
  use {
    'terrortylor/nvim-comment',
    config = [[require('modules.nvim-comment')]]
  }
  use {'tpope/vim-surround'}
  use {
    'lewis6991/gitsigns.nvim',
    requires = {
      'nvim-lua/plenary.nvim'
    },
    config = [[require('modules.gitsigns')]]
  }
  use {'editorconfig/editorconfig-vim'}
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
  use {'nikvdp/ejs-syntax'}
  use {
    'lukas-reineke/indent-blankline.nvim',
    branch = 'lua',
    config = [[require('modules.indentline')]]
  }
end)
