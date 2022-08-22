local lspconfig = require("lspconfig")
local opts = require("modules.nvim-lspconfig.opts")

lspconfig.tsserver.setup(vim.tbl_extend("force", opts, {
	filetypes = {
		"javascript",
		"javascriptreact",
		"javascript.jsx",
		"typescript",
		"typescriptreact",
		"typescript.tsx",
	},
	compilerOptions = {
		module = "commonjs",
		target = "es6",
		checkJs = false,
	},
	exclude = {
		"node_modules",
	},
}))
