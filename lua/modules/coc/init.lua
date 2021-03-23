local utils = require('common.utils')

local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
  local col = vim.fn.col('.') - 1
  if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
    return true
  else
    return false
  end
end

_G.tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-n>"
  elseif check_back_space() then
    return t "<Tab>"
  else
    return vim.fn['coc#refresh']()
  end
end
_G.s_tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-p>"
  else
    return t "<S-Tab>"
  end
end

_G.confirm_selection = function()
  if vim.fn.pumvisible() == 1 then
    return vim.fn['coc#_select_confirm']()
  else
    return t "<C-g>u<CR><c-r>=coc#on_enter()<CR>"
  end
end

vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", {expr = true, silent = true})
vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true, silent = true})
vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true, silent = true})
vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true, silent = true})
vim.api.nvim_set_keymap('i', '<C-space>', 'coc#refresh()', { noremap = true, silent = true, expr = true })
vim.api.nvim_set_keymap('i', '<CR>', "v:lua.confirm_selection()", { expr = true, noremap = true, silent = true })

-- Highlight the symbol and its references when holding the cursor.
vim.cmd("autocmd CursorHold * silent call CocActionAsync('highlight')")

-- Symbol renaming
vim.api.nvim_set_keymap('n', '<space>r', '<Plug>(coc-rename)', { silent = true })

-- formatting selected code
vim.api.nvim_set_keymap('x', '<space>f', '<Plug>(coc-format-selected)', { silent = true })
vim.api.nvim_set_keymap('n', '<space>f', '<Plug>(coc-format-selected)', { silent = true })

utils.create_augroup({
    -- Setup formatexpr specified filetype(s).
    { "FileType typescript,json setl formatexpr=CocAction('formatSelected')" };
    -- Update signature help on jump placeholder.
    { "User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')" };
  }, 'mygroup')


-- Applying codeAction to the selected region.
-- Example: `<leader>aap` for current paragraph
vim.api.nvim_set_keymap('x', '<leader>a', '<Plug>(coc-codeaction-selected', {})
vim.api.nvim_set_keymap('n', '<leader>a', '<Plug>(coc-codeaction-selected', {})

-- Remap keys for applying codeAction to the current buffer.
vim.api.nvim_set_keymap('x', '<leader>gf', '<Plug>(coc-fix-current)', {})
vim.api.nvim_set_keymap('n', '<leader>gf', '<Plug>(coc-fix-current)', {})

-- Use CTRL-S for selections ranges.
-- Requires 'textDocument/selectionRange' support of language server.
vim.api.nvim_set_keymap('x', '<C-s>', '<Plug>(coc-range-select)', { silent = true })
vim.api.nvim_set_keymap('n', '<C-s>', '<Plug>(coc-range-select)', { silent = true })

-- Add `:Format` command to format current buffer.
vim.cmd("command! -nargs=0 Format :call CocAction('format')")

-- Add `:Fold` command to fold current buffer.
vim.cmd("command! -nargs=? Fold :call     CocAction('fold', <f-args>)")

-- Add `:OR` command for organize imports of the current buffer.
vim.cmd("command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')")

vim.cmd("set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}")

-- Mappings for CoCList
-- Show all diagnostics
vim.api.nvim_set_keymap('n', '<space>a', ':CocList diagnostics<CR>', { noremap = true, silent = true, nowait = true })
-- Manage extensions
vim.api.nvim_set_keymap('n', '<space>e', ':CocList extensions<CR>', { noremap = true, silent = true, nowait = true })
-- Show commands.
vim.api.nvim_set_keymap('n', '<space>c', ':CocList commands<CR>', { noremap = true, silent = true, nowait = true })
-- Find symbol of current document
vim.api.nvim_set_keymap('n', '<space>o', ':CocList outline<CR>', { noremap = true, silent = true, nowait = true })
-- Search workspace symbols
vim.api.nvim_set_keymap('n', '<space>s', ':CocList -I symbols<CR>', { noremap = true, silent = true, nowait = true })
-- Marketplace
vim.api.nvim_set_keymap('n', '<space>m', ':CocList marketplace<CR>', { noremap = true, silent = true, nowait = true })
-- Do default action for next item.
vim.api.nvim_set_keymap('n', '<space>j', ':CocNext<CR>', { noremap = true, silent = true, nowait = true })
-- Do default action for previous item.
vim.api.nvim_set_keymap('n', '<space>k', ':CocPrev<CR>', { noremap = true, silent = true, nowait = true })
-- Resume latest coc list.
vim.api.nvim_set_keymap('n', '<space>p', ':CocListResume<CR>', { noremap = true, silent = true, nowait = true })
