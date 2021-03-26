-- keep installed
vim.g.coc_global_extensions = {
  'coc-blade-formatter',
  'coc-css',
  'coc-diagnostic',
  'coc-emmet',
  'coc-eslint',
  'coc-git',
  'coc-highlight',
  'coc-html',
  'coc-htmlhint',
  'coc-json',
  'coc-marketplace',
  'coc-pairs',
  'coc-phpls',
  'coc-python',
  'coc-sh',
  'coc-tsserver',
  'coc-yaml',
  'coc-xml',
}

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

vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", {noremap = true, expr = true, silent = true})
vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", {noremap = true, expr = true, silent = true})
vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", {noremap = true, expr = true, silent = true})
vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", {noremap = true, expr = true, silent = true})
vim.api.nvim_set_keymap('i', '<C-space>', 'coc#refresh()', { noremap = true, silent = true, expr = true })
vim.api.nvim_set_keymap('i', '<CR>', "v:lua.confirm_selection()", {noremap = true, expr = true,  silent = true })

-- Use `[g` and `]g` to navigate diagnostics
-- Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
vim.api.nvim_set_keymap('n', 'gn', '<Plug>(coc-diagnostic-prev)', { silent = true })
vim.api.nvim_set_keymap('n', 'gp', '<Plug>(coc-diagnostic-next)', { silent = true })

-- GoTo code navigation.
vim.api.nvim_set_keymap('n', 'gd', '<Plug>(coc-definition)', { silent = true })
vim.api.nvim_set_keymap('n', 'gy', '<Plug>(coc-type-definition)', { silent = true })
vim.api.nvim_set_keymap('n', 'gi', '<Plug>(coc-implementation)', { silent = true })
vim.api.nvim_set_keymap('n', 'gr', '<Plug>(coc-references)', { silent = true })

-- Use K to show documentation in preview window.
-- nnoremap <silent> K :call <SID>show_documentation()<CR>
vim.api.nvim_set_keymap('n', 'K', 'v:lua.show_documentation()', { noremap = true, silent = true })

-- TODO convert to lua
-- function! s:show_documentation()
--   if (index(['vim','help'], &filetype) >= 0)
--     execute 'h '.expand('<cword>')
--   elseif (coc#rpc#ready())
--     call CocActionAsync('doHover')
--   else
--     execute '!' . &keywordprg . " " . expand('<cword>')
--   endif
-- endfunction

-- Highlight the symbol and its references when holding the cursor.
vim.cmd("autocmd CursorHold * silent call CocActionAsync('highlight')")

-- Symbol renaming
vim.api.nvim_set_keymap('n', '<leader>rn', '<Plug>(coc-rename)', { silent = true })

-- formatting selected code
vim.api.nvim_set_keymap('x', '<leader>af', '<Plug>(coc-format-selected)', { silent = true })
vim.api.nvim_set_keymap('n', '<leader>af', '<Plug>(coc-format-selected)', { silent = true })

utils.create_augroup({
    -- Setup formatexpr specified filetype(s).
    { "FileType typescript,json setl formatexpr=CocAction('formatSelected')" };
    -- Update signature help on jump placeholder.
    { "User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')" };
  }, 'mygroup')


-- Applying codeAction to the selected region.
-- Example: `<leader>aap` for current paragraph
vim.api.nvim_set_keymap('x', '<leader>as', '<Plug>(coc-codeaction-selected)', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>as', '<Plug>(coc-codeaction-selected)', { noremap = true, silent = true })

vim.api.nvim_set_keymap('x', '<leader>ac', '<Plug>(coc-codeaction)', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>ac', '<Plug>(coc-codeaction)', { noremap = true, silent = true })

-- Remap keys for applying codeAction to the current buffer.
vim.api.nvim_set_keymap('x', '<leader>gf', '<Plug>(coc-fix-current)', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>gf', '<Plug>(coc-fix-current)', { noremap = true, silent = true })

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

-- Mappings for CoCList
-- Show all diagnostics
vim.api.nvim_set_keymap('n', '<leader>ad', ':CocList diagnostics<CR>', { noremap = true, silent = true })
-- Manage extensions
vim.api.nvim_set_keymap('n', '<leader>e', ':CocList extensions<CR>', { noremap = true, silent = true, nowait = true })
-- Format current buffer
vim.api.nvim_set_keymap('n', '<leader>f', ':Format<CR>', { noremap = true, silent = true, nowait = true })
-- Show commands.
vim.api.nvim_set_keymap('n', '<leader>c', ':CocList commands<CR>', { noremap = true, silent = true, nowait = true })
-- Find symbol of current document
vim.api.nvim_set_keymap('n', '<leader>o', ':CocList outline<CR>', { noremap = true, silent = true, nowait = true })
-- Search workspace symbols
vim.api.nvim_set_keymap('n', '<leader>s', ':CocList -I symbols<CR>', { noremap = true, silent = true, nowait = true })
-- Marketplace
vim.api.nvim_set_keymap('n', '<leader>m', ':CocList marketplace<CR>', { noremap = true, silent = true, nowait = true })
-- Do default action for next item.
vim.api.nvim_set_keymap('n', '<leader>j', ':CocNext<CR>', { noremap = true, silent = true, nowait = true })
-- Do default action for previous item.
vim.api.nvim_set_keymap('n', '<leader>k', ':CocPrev<CR>', { noremap = true, silent = true, nowait = true })
-- Resume latest coc list.
vim.api.nvim_set_keymap('n', '<leader>p', ':CocListResume<CR>', { noremap = true, silent = true, nowait = true })
