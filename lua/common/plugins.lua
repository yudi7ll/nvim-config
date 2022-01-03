local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

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
})

return packer.startup(function(use)
	use({ "wbthomason/packer.nvim" })
	use({ "yudi7ll/onearc.nvim" })
	use({ "neoclide/coc.nvim", branch = "master", run = "yarn install --package-lock" })
	-- fzf
	use({ "junegunn/fzf" })
	use({ "junegunn/fzf.vim" })
	use({ "antoinemadec/coc-fzf" })
	-- Icons
	use({ "kyazdani42/nvim-web-devicons" })
	-- General
	use({ "antoinemadec/FixCursorHold.nvim" })
	use({ "kyazdani42/nvim-tree.lua" })
	use({ "glepnir/galaxyline.nvim", branch = "main" })
	use({ "terrortylor/nvim-comment" })
	use({ "tpope/vim-surround" })
	use({ "tpope/vim-sleuth" })
	use({ "nvim-lua/plenary.nvim" })
	use({ "lewis6991/gitsigns.nvim" })
	use({ "editorconfig/editorconfig-vim" })
	use({ "akinsho/nvim-bufferline.lua" })
	use({ "folke/which-key.nvim" })
	use({ "voldikss/vim-floaterm" })
	use({ "SmiteshP/nvim-gps" })
	use({ "andweeb/presence.nvim", config = [[require('presence')]] })
	-- treesitter
	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
	use({ "JoosepAlviste/nvim-ts-context-commentstring" })
	use({ "p00f/nvim-ts-rainbow" })
	-- Highlighting
	use({ "jwalton512/vim-blade", opt = true, ft = "blade" })
	use({ "nikvdp/ejs-syntax", opt = true, ft = "ejs" })
	use({ "chr4/nginx.vim", opt = true, ft = "nginx" })
	use({ "styled-components/vim-styled-components", branch = "main" })

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		packer.sync()
	end
end)
