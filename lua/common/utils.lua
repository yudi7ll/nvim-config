local utils = {}

local map = function(mode, key, cmd, config)
	vim.api.nvim_set_keymap(mode, key, cmd, vim.tbl_extend("force", { noremap = true, silent = true }, config or {}))
end

function utils.nmap(key, cmd, config)
	map("n", key, cmd, config)
end

function utils.xmap(key, cmd, config)
	map("x", key, cmd, config)
end

function utils.imap(key, cmd, config)
	map("i", key, cmd, config)
end

function utils.smap(key, cmd, config)
	map("s", key, cmd, config)
end

function utils.tmap(key, cmd, config)
	map("t", key, cmd, config)
end

function utils.vmap(key, cmd, config)
	map("v", key, cmd, config)
end

return utils
