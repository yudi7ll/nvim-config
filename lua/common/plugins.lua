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
  -- use {'morhetz/gruvbox'}

  -- LSP
  -- use {
  --   'neovim/nvim-lspconfig',
  --   config = function() require('modules.lsp') end
  -- }
  -- use {
  --   'glepnir/lspsaga.nvim',
  --   config = function() require('lspsaga').init_lsp_saga() end
  -- }
  -- use {
  --   'onsails/lspkind-nvim',
  --   config = function() require('lspkind').init() end
  -- }
  -- use {
  --   'kosayoda/nvim-lightbulb',
  --   config = function() require('modules.nvim-lightbulb') end
  -- }

  -- Autocomplete
  -- use {
  --   'hrsh7th/nvim-compe',
  --   config = function() require('modules.compe') end,
  --   requires = {
  --     {'hrsh7th/vim-vsnip'},
  --     {'hrsh7th/vim-vsnip-integ'}
  --   }
  -- }
  use {
  'neoclide/coc.nvim', branch = 'release',
  config = function() require('modules.coc') end
}

  -- use {
  --   'nvim-treesitter/nvim-treesitter', run = ':TSUpdate', branch = 'master',
  --   config = function() require('modules.tree-sitter') end
  -- }

  -- Icons
  use {'kyazdani42/nvim-web-devicons'}
  use {'ryanoasis/vim-devicons'}

  -- General
  use {'windwp/nvim-autopairs',
    config = function() require('modules.nvim-autopairs') end
  }
  use {'vijaymarupudi/nvim-fzf'}
  use {'andweeb/presence.nvim'}
  -- use {
  --   'kyazdani42/nvim-tree.lua',
  --   config = function() require('modules.nvim-tree') end
  -- }
  -- use {
  --   'Shougo/defx.nvim', run = ':UpdateRemoteuseins',
  --   config = function() require('modules.defx') end
  -- }
  -- use {
  --   'lambdalisue/fern.vim',
  --   config = function() require('modules.fern') end
  -- }
  -- use {'lambdalisue/fern-git-status.vim'}
  -- use {'antoinemadec/FixCursorHold.nvim'}
  use {
    'preservim/nerdtree',
    config = function() require('modules.nerdtree') end,
    requires = {
      {'Xuyuanp/nerdtree-git-plugin'},
      {'tiagofumo/vim-nerdtree-syntax-highlight'}
    }
  }
  -- use {
  --   'norcalli/nvim-colorizer.lua',
  --   config = function() require'colorizer'.setup() end
  -- }
  use {
    'glepnir/galaxyline.nvim', branch = 'main',
    config = function() require('modules.galaxyline') end
  }
  use {
    'terrortylor/nvim-comment',
    config = function() require('nvim_comment').setup() end
  }
  use {'tpope/vim-surround'}
  use {'tpope/vim-fugitive'}
  use {'airblade/vim-gitgutter'}
  use {'editorconfig/editorconfig-vim'}
  use {
    'Yggdroot/indentLine',
    config = function() require('modules.indentline') end
  }
  -- use {
  --   'glepnir/indent-guides.nvim',
  --   config = function() require('indent_guides').setup({}) end
  -- }
  use {'tommcdo/vim-lion'}
  use {
    'sheerun/vim-polyglot',
    config = function() require('modules.polyglot') end
  }
  use {
    'akinsho/nvim-bufferline.lua',
    config = function() require('modules.bufferline') end
  }
  -- use {
  --   'romgrk/barbar.nvim',
  --   config = function() require('modules.barbar') end
  -- }
  use {'moll/vim-bbye'}
  use {'liuchengxu/vim-which-key'}
  use {'pangloss/vim-javascript'}
  use {
    'voldikss/vim-floaterm',
    config = function() require('modules.floaterm') end
  }
end)
