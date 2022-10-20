local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

---@diagnostic disable-next-line: missing-parameter
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system({
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  })
  print("Installing packer close and reopen Neovim...")
  vim.cmd([[packadd packer.nvim]])
end

local packer = require("packer")

packer.init({
  git = { clone_timeout = 9999 },
  autoremove = true,
})

packer.startup(function(use)
  use({ "wbthomason/packer.nvim" })
  use({ "yudi7ll/onearc.nvim" })
  use({ "williamboman/mason.nvim" })
  use({ "williamboman/mason-lspconfig.nvim" })
  -- lsp & utilities
  use({ "neovim/nvim-lspconfig" })
  use({ "onsails/lspkind.nvim" })
  use({ "jose-elias-alvarez/null-ls.nvim" })
  use({ "tamago324/nlsp-settings.nvim" })
  use({ "j-hui/fidget.nvim" })
  -- completion
  use({ "hrsh7th/nvim-cmp" })
  use({ "hrsh7th/cmp-nvim-lua" })
  use({ "folke/neodev.nvim" })
  use({ "hrsh7th/cmp-nvim-lsp" })
  use({ "lukas-reineke/cmp-under-comparator" })
  use({ "hrsh7th/cmp-buffer" })
  use({ "hrsh7th/cmp-path" })
  use({ "L3MON4D3/LuaSnip" })
  use({ "saadparwaiz1/cmp_luasnip" })
  use({ "hrsh7th/cmp-nvim-lsp-signature-help" })
  use({ "b0o/schemastore.nvim" })
  use({ "davidsierradz/cmp-conventionalcommits" })
  use({ "mattn/emmet-vim" })
  -- wip: debugging
  use({ "mfussenegger/nvim-dap" })
  use({ "rcarriga/nvim-dap-ui" })
  use({ "mxsdev/nvim-dap-vscode-js" })
  -- git
  use({ "lewis6991/gitsigns.nvim" })
  use({ "rhysd/conflict-marker.vim" })
  -- ui
  use({ "RishabhRD/nvim-lsputils", requires = "RishabhRD/popfix" })
  use({ "CosmicNvim/cosmic-ui", requires = "MunifTanjim/nui.nvim" })
  use({ "nvim-lualine/lualine.nvim" })
  use({ "akinsho/bufferline.nvim" })
  use({ "voldikss/vim-floaterm" })
  use({ "ziontee113/color-picker.nvim" })
  -- other
  use({ "kyazdani42/nvim-web-devicons" })
  use({ "antoinemadec/FixCursorHold.nvim" })
  use({ "windwp/nvim-autopairs" })
  use({ "kyazdani42/nvim-tree.lua" })
  use({ "terrortylor/nvim-comment" })
  use({ "tpope/vim-surround" })
  use({ "tpope/vim-sleuth" })
  use({ "nvim-lua/plenary.nvim" })
  use({ "editorconfig/editorconfig-vim" })
  use({ "folke/which-key.nvim" })
  use({ "andweeb/presence.nvim" })
  use({ "dstein64/vim-startuptime" })
  use({ "SmiteshP/nvim-navic" })
  use({ "nvim-telescope/telescope.nvim" })
  use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
  use({ "junegunn/vim-slash" })
  use({ "tpope/vim-repeat" })

  -- treesitter
  use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate", commit = '4cccb6f494eb255b32a290d37c35ca12584c74d0' })
  use({ "JoosepAlviste/nvim-ts-context-commentstring" })
  use({ "p00f/nvim-ts-rainbow" })
  use({ "RRethy/nvim-treesitter-textsubjects" })
  use({ "nvim-treesitter/nvim-treesitter-textobjects" })
  -- Highlighting
  use({ "jwalton512/vim-blade", opt = true, ft = "blade" })
  use({ "nikvdp/ejs-syntax", opt = true, ft = "ejs" })
  use({ "chr4/nginx.vim", opt = true, ft = "nginx" })
  use({ "styled-components/vim-styled-components", opt = true, ft = { "javascriptreact", "typescriptreact" } })
  use({ "norcalli/nvim-colorizer.lua" })

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    packer.sync()
  end
end)
