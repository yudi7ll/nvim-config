local utils = {}

local map = function(mode, key, cmd, config)
    vim.api.nvim_set_keymap(
        mode,
        key,
        cmd,
        config or { noremap = true, silent = true }
    )
end

function utils.nmap(key, cmd, config)
    map('n', key, cmd, config)
end

function utils.xmap(key, cmd, config)
    map('x', key, cmd, config)
end

function utils.imap(key, cmd, config)
    map('i', key, cmd, config)
end

function utils.smap(key, cmd, config)
    map('s', key, cmd, config)
end

function utils.vmap(key, cmd, config)
    map('v', key, cmd, config)
end

function utils.create_augroup(autocmds, name)
    local cmd = vim.cmd

    cmd('augroup ' .. name)
    cmd('autocmd!')
    for _, autocmd in ipairs(autocmds) do
        cmd('autocmd ' .. table.concat(autocmd, ' '))
    end
    cmd('augroup END')
end

return utils
