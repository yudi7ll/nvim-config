
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

require('packer').init({
  git = { clone_timeout = 9999 }
})

return require('packer').startup(function(use)
  use {'wbthomason/packer.nvim'}

  -- colorscheme
  use {'yudi7ll/onearc.nvim'}

  -- coc
  use { 'neoclide/coc.nvim', branch = 'release' }

  -- Icons
  use { 'kyazdani42/nvim-web-devicons' }

  -- General
  use {'kyazdani42/nvim-tree.lua'}
  use {'glepnir/galaxyline.nvim', branch = 'main' }
  use {'terrortylor/nvim-comment'}
  use {'tpope/vim-surround'}
  use {'tpope/vim-sleuth'}
  use {'nvim-lua/plenary.nvim'}
  use {'lewis6991/gitsigns.nvim'}
  use {'editorconfig/editorconfig-vim'}
  use {'tommcdo/vim-lion', opt = true, ft = 'lua'}
  use {'akinsho/nvim-bufferline.lua'}
  use {'liuchengxu/vim-which-key'}
  use {'AckslD/nvim-whichkey-setup.lua'}
  use {'voldikss/vim-floaterm'}
  use {"SmiteshP/nvim-gps"}
  use {'andweeb/presence.nvim'}

  -- treesitter
  use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
  use {'nvim-treesitter/nvim-treesitter-refactor'}
  use {'JoosepAlviste/nvim-ts-context-commentstring'}

  -- Highlighting
  use {'jwalton512/vim-blade', opt = true, ft = 'blade'}
  use {'nikvdp/ejs-syntax', opt = true, ft = 'ejs'}
  use {'chr4/nginx.vim', opt = true, ft = 'nginx'}
  use {'styled-components/vim-styled-components', branch = 'main'}


  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
