
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

-- keep installed
vim.g.coc_global_extensions = {
  'coc-css',
  'coc-diagnostic',
  'coc-eslint',
  'coc-highlight',
  'coc-html',
  'coc-json',
  'coc-marketplace',
  'coc-phpls',
  'coc-prettier',
  'coc-python',
  'coc-sh',
  'coc-tslint',
  'coc-tsserver',
  'coc-yaml',
  'coc-xml',
}


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

utils.imap("<Tab>", "v:lua.tab_complete()", {noremap = true, expr = true, silent = true})
utils.imap("<C-j>", "v:lua.tab_complete()", {noremap = true, expr = true, silent = true})
utils.smap("<Tab>", "v:lua.tab_complete()", {noremap = true, expr = true, silent = true})
utils.imap("<S-Tab>", "v:lua.s_tab_complete()", {noremap = true, expr = true, silent = true})
utils.imap("<C-k>", "v:lua.s_tab_complete()", {noremap = true, expr = true, silent = true})
utils.smap("<S-Tab>", "v:lua.s_tab_complete()", {noremap = true, expr = true, silent = true})
utils.imap('<C-space>', 'coc#refresh()', { noremap = true, silent = true, expr = true })
utils.imap('<CR>', "v:lua.confirm_selection()", {noremap = true, expr = true,  silent = true })

-- Use `[g` and `]g` to navigate diagnostics
-- Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
utils.nmap('gn', '<Plug>(coc-diagnostic-prev)')
utils.nmap('gp', '<Plug>(coc-diagnostic-next)')

-- GoTo code navigation.
utils.nmap('gd', '<Plug>(coc-definition)')
utils.nmap('gy', '<Plug>(coc-type-definition)')
utils.nmap('gi', '<Plug>(coc-implementation)')
utils.nmap('gr', '<Plug>(coc-references)')

-- Use K to show documentation in preview window.
utils.nmap('K', ":call <SID>show_documentation()<CR>")

vim.cmd(
  [[

    function! s:show_documentation()
      if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
      elseif (coc#rpc#ready())
        call CocActionAsync('doHover')
      else
        execute '!' . &keywordprg . " " . expand('<cword>')
      endif
    endfunction
  ]])

-- scroll float windows/popups
_G.n_scroll_down = function ()
  if vim.fn['coc#float#has_scroll']() then
    return vim.fn['coc#float#scroll'](1)
  else
    return t "<Down>"
  end
end

_G.i_scroll_down = function ()
  if vim.fn['coc#float#has_scroll']() then
    return t "<C-r>" .. vim.fn['coc#float#scroll'](1) .. t "<CR>"
  else
    return t "<Down>"
  end
end

_G.n_scroll_up = function ()
  if vim.fn['coc#float#has_scroll']() then
    return vim.fn['coc#float#scroll'](0)
  else
    return t "<Up>"
  end
end

_G.i_scroll_up = function ()
  if vim.fn['coc#float#has_scroll']() then
    return t "<C-r>" .. vim.fn['coc#float#scroll'](0) .. t "<CR>"
  else
    return t "<Up>"
  end
end

-- scroll float windows/popup mappings
utils.nmap('<Down>', 'v:lua.n_scroll_down()', { noremap = true, silent = true, nowait = true, expr = true })
utils.vmap('<Down>', 'v:lua.n_scroll_down()', { noremap = true, silent = true, nowait = true, expr = true })
utils.imap('<Down>', 'v:lua.i_scroll_down()', { noremap = true, silent = true, nowait = true, expr = true })
utils.nmap('<Up>', 'v:lua.n_scroll_up()', { noremap = true, silent = true, nowait = true, expr = true })
utils.vmap('<Up>', 'v:lua.n_scroll_up()', { noremap = true, silent = true, nowait = true, expr = true })
utils.imap('<Up>', 'v:lua.i_scroll_up()', { noremap = true, silent = true, nowait = true, expr = true })

-- Highlight the symbol and its references when holding the cursor.
vim.cmd("autocmd CursorHold * silent call CocActionAsync('highlight')")

-- Symbol renaming
utils.nmap('<leader>rn', '<Plug>(coc-rename)')

-- formatting selected code
utils.xmap('<leader>af', '<Plug>(coc-format-selected)')
utils.nmap('<leader>af', '<Plug>(coc-format-selected)')

utils.create_augroup({
    -- Setup formatexpr specified filetype(s).
    { "FileType typescript,json setl formatexpr=CocAction('formatSelected')" };
    -- Update signature help on jump placeholder.
    { "User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')" };
  }, 'mygroup')


-- Applying codeAction to the selected region.
-- Example: `<leader>aap` for current paragraph
utils.xmap('<leader>as', '<Plug>(coc-codeaction-selected)')
utils.nmap('<leader>as', '<Plug>(coc-codeaction-selected)')

utils.xmap('<leader>ac', '<Plug>(coc-codeaction)')
utils.nmap('<leader>ac', '<Plug>(coc-codeaction)')

-- Remap keys for applying codeAction to the current buffer.
utils.xmap('<leader>gf', '<Plug>(coc-fix-current)')
utils.nmap('<leader>gf', '<Plug>(coc-fix-current)')

-- Use CTRL-S for selections ranges.
-- Requires 'textDocument/selectionRange' support of language server.
utils.xmap('<C-s>', '<Plug>(coc-range-select)')
utils.nmap('<C-s>', '<Plug>(coc-range-select)')

-- Add `:Format` command to format current buffer.
vim.cmd("command! -nargs=0 Format :call CocAction('format')")
-- Add `:Fold` command to fold current buffer.
vim.cmd("command! -nargs=? Fold :call CocAction('fold', <f-args>)")
-- Add `:OR` command for organize imports of the current buffer.
vim.cmd("command! -nargs=0 OR :call CocAction('runCommand', 'editor.action.organizeImport')")
-- Add `:Prettier` command for formatting file
vim.cmd('command! -nargs=0 Prettier :CocCommand prettier.formatFile')

-- Mappings for CoCList
-- Show all diagnostics
utils.nmap('<leader>ad', ':CocList diagnostics<CR>')
-- Organize import
utils.nmap('<leader>ao', ':OR<CR>')
-- Manage extensions
utils.nmap('<leader>e', ':CocList extensions<CR>', { noremap = true, silent = true, nowait = true })
-- Format current buffer
utils.nmap('<leader>f', ':Format<CR>', { noremap = true, silent = true, nowait = true })
-- Show commands.
utils.nmap('<leader>c', ':CocList commands<CR>', { noremap = true, silent = true, nowait = true })
-- Find symbol of current document
utils.nmap('<leader>o', ':CocList outline<CR>', { noremap = true, silent = true, nowait = true })
-- Search workspace symbols
utils.nmap('<leader>s', ':CocList -I symbols<CR>', { noremap = true, silent = true, nowait = true })
-- Marketplace
utils.nmap('<leader>m', ':CocList marketplace<CR>', { noremap = true, silent = true, nowait = true })
-- Do default action for next item.
utils.nmap('<leader>j', ':CocNext<CR>', { noremap = true, silent = true, nowait = true })
-- Do default action for previous item.
utils.nmap('<leader>k', ':CocPrev<CR>', { noremap = true, silent = true, nowait = true })
-- Resume latest coc list.
utils.nmap('<leader>p', ':CocListResume<CR>', { noremap = true, silent = true, nowait = true })

-- Mappings for CocCommand
utils.nmap('<leader>p', ':CocCommand editor.action.pickColor<CR>', { noremap = true, silent = true, nowait = true  })
utils.nmap('<C-n>', ':CocCommand explorer<CR>')
