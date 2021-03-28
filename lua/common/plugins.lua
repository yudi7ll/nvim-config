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
  use {'windwp/nvim-autopairs',
    config = [[require('modules.nvim-autopairs')]]
  }
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
    'liuchengxu/vim-which-key',
    config = [[require('modules.vim-which-key')]]
  }
  use {'pangloss/vim-javascript'}
  use {
    'voldikss/vim-floaterm',
    config = [[require('modules.floaterm')]]
  }
  use {'wsdjeg/notifications.vim'}
end)
