local lspconfig = require("lspconfig")
local opts = require("modules.nvim-lspconfig.opts")

lspconfig.jsonls.setup(vim.tbl_extend("force", opts, {
	settings = {
		json = {
			schemas = require("schemastore").json.schemas({}),
			validate = { enable = true },
		},
	},
}))
