local utils = require("common.utils")

local t = function(str)
	return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
	local col = vim.fn.col(".") - 1
	if col == 0 or vim.fn.getline("."):sub(col, col):match("%s") then
		return true
	else
		return false
	end
end

_G.next_selection = function()
	if vim.fn["coc#pum#visible"]() == 1 then
		return vim.fn["coc#pum#next"](1)
	else
		return vim.fn["coc#refresh"]()
	end
end
_G.prev_selection = function()
	if vim.fn["coc#pum#visible"]() == 1 then
		return vim.fn["coc#pum#prev"](1)
	else
		return t("<S-Tab>")
	end
end

_G.confirm_selection = function()
	if vim.fn["coc#pum#visible"]() == 1 then
		return vim.fn["coc#pum#confirm"]()
	elseif check_back_space() then
		return t("<Tab>")
	else
		return vim.fn["coc#refresh"]()
	end
end

-- force enter key to do newline only
_G.on_enter = function()
	return t("<C-g>u<CR><c-r>=coc#on_enter()<CR>")
end

local opts = { noremap = true, expr = true, silent = true }
utils.imap("<A-j>", "v:lua.next_selection()", opts)
utils.imap("<A-k>", "v:lua.prev_selection()", opts)
utils.imap("<ArrowDown>", "v:lua.next_selection()", opts)
utils.imap("<ArrowUp>", "v:lua.prev_selection()", opts)
utils.imap("<C-space>", "coc#refresh()", opts)
utils.imap("<Tab>", "v:lua.confirm_selection()", opts)
utils.imap("<CR>", "v:lua.on_enter()", opts)

-- scroll float windows/popups
_G.n_scroll_down = function()
	if vim.fn["coc#float#has_scroll"]() then
		return vim.fn["coc#float#scroll"](1)
	else
		return t("<PageDown>")
	end
end

_G.i_scroll_down = function()
	if vim.fn["coc#float#has_scroll"]() then
		return t("<C-r>") .. vim.fn["coc#float#scroll"](1) .. t("<CR>")
	else
		return t("<PageDown>")
	end
end

_G.n_scroll_up = function()
	if vim.fn["coc#float#has_scroll"]() then
		return vim.fn["coc#float#scroll"](0)
	else
		return t("<PageUp>")
	end
end

_G.i_scroll_up = function()
	if vim.fn["coc#float#has_scroll"]() then
		return t("<C-r>") .. vim.fn["coc#float#scroll"](0) .. t("<CR>")
	else
		return t("<PageUp>")
	end
end

-- scroll float windows/popup mappings
local float_opts = { noremap = true, silent = true, nowait = true, expr = true }
utils.nmap("<PageDown>", "v:lua.n_scroll_down()", float_opts)
utils.vmap("<PageDown>", "v:lua.n_scroll_down()", float_opts)
utils.imap("<PageDown>", "v:lua.i_scroll_down()", float_opts)
utils.nmap("<PageUp>", "v:lua.n_scroll_up()", float_opts)
utils.vmap("<PageUp>", "v:lua.n_scroll_up()", float_opts)
utils.imap("<PageUp>", "v:lua.i_scroll_up()", float_opts)
