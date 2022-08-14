local utils = {}

local map = function(mode, key, cmd, config)
	vim.keymap.set(mode, key, cmd, config or { silent = true })
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

function utils.create_augroup(autocmds, name)
	local cmd = vim.cmd

	cmd("augroup " .. name)
	cmd("autocmd!")

	for _, autocmd in ipairs(autocmds) do
		cmd("autocmd " .. table.concat(autocmd, " "))
	end
	cmd("augroup END")
end

function utils.merge(template)
  local result = {}
  for key, value in pairs(template) do
    result[key] = value
  end

  return function(table)
    for key, value in pairs(table) do
      result[key] = value
    end
    return result
  end
end

return utils
