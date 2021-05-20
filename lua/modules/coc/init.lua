require('modules.coc.auto-completion')
require('modules.coc.mappings')

local utils = require('common.utils')

-- keep installed
vim.g.coc_global_extensions = {
  'coc-css',
  'coc-diagnostic',
  'coc-emmet',
  'coc-eslint',
  'coc-highlight',
  'coc-html',
  'coc-json',
  'coc-marketplace',
  'coc-phpls',
  'coc-prettier',
  'coc-pyright',
  'coc-sh',
  'coc-tsserver',
  'coc-yaml',
  'coc-xml',
}

vim.cmd([[
    function ShowDocumentation()
      if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
      elseif (coc#rpc#ready())
        call CocActionAsync('doHover')
      else
        execute '!' . &keywordprg . " " . expand('<cword>')
      endif
    endfunction
  ]])

-- Use K to show documentation in preview window.
utils.nmap('K', ":call ShowDocumentation()<CR>")

-- Highlight the symbol and its references when holding the cursor.
vim.cmd("autocmd CursorHold * silent call CocActionAsync('highlight')")

-- Add `:Format` command to format current buffer.
vim.cmd("command! -nargs=0 Format :call CocAction('format')")
-- Add `:Fold` command to fold current buffer.
vim.cmd("command! -nargs=? Fold :call CocAction('fold', <f-args>)")
-- Add `:OR` command for organize imports of the current buffer.
vim.cmd("command! -nargs=0 OR :call CocAction('runCommand', 'editor.action.organizeImport')")
-- Add `:Prettier` command for formatting file
vim.cmd('command! -nargs=0 Prettier :CocCommand prettier.formatFile')

utils.create_augroup({
    -- Setup formatexpr specified filetype(s).
    { "FileType typescript,json setl formatexpr=CocAction('formatSelected')" };
    -- Update signature help on jump placeholder.
    { "User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')" };
  }, 'mygroup')

