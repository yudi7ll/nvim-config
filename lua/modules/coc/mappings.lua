local utils = require('common.utils')

-- a
utils.xmap('<leader>ac', '<Plug>(coc-codeaction)')
utils.nmap('<leader>ac', '<Plug>(coc-codeaction)')
utils.xmap('<leader>af', '<Plug>(coc-fix-current)')
utils.nmap('<leader>af', '<Plug>(coc-fix-current)')
utils.xmap('<leader>aF', '<Plug>(coc-format-selected)')
utils.nmap('<leader>aF', '<Plug>(coc-format-selected)')
utils.xmap('<leader>aS', '<Plug>(coc-range-select)')
utils.nmap('<leader>aS', '<Plug>(coc-range-select)')
utils.xmap('<leader>as', '<Plug>(coc-codeaction-selected)')
utils.nmap('<leader>as', '<Plug>(coc-codeaction-selected)')
utils.nmap('<leader>ar', '<Plug>(coc-rename)')

-- c
utils.nmap('<leader>cd', ':CocList diagnostics<CR>')
utils.nmap('<leader>ce', ':CocList extensions<CR>', { noremap = true, silent = true, nowait = true })
utils.nmap('<leader>cf', ':Format<CR>', { noremap = true, silent = true, nowait = true })
utils.nmap('<leader>cF', ':OR<CR>', { noremap = true, silent = true, nowait = true })
utils.nmap('<leader>cc', ':CocList commands<CR>', { noremap = true, silent = true, nowait = true })
utils.nmap('<leader>co', ':CocList outline<CR>', { noremap = true, silent = true, nowait = true })
utils.nmap('<leader>cs', ':CocList -I symbols<CR>', { noremap = true, silent = true, nowait = true })
utils.nmap('<leader>cj', ':CocNext<CR>', { noremap = true, silent = true, nowait = true })
utils.nmap('<leader>ck', ':CocPrev<CR>', { noremap = true, silent = true, nowait = true })
utils.nmap('<leader>cp', ':CocListResume<CR>', { noremap = true, silent = true, nowait = true })

-- GoTo code navigation.
utils.nmap('gd', '<Plug>(coc-definition)')
utils.nmap('gy', '<Plug>(coc-type-definition)')
utils.nmap('gi', '<Plug>(coc-implementation)')
utils.nmap('gr', '<Plug>(coc-references)')

-- Navigate diagnostics of current buffer
utils.nmap('gn', '<Plug>(coc-diagnostic-prev)')
utils.nmap('gp', '<Plug>(coc-diagnostic-next)')

-- coc marketplace
utils.nmap('<leader>m', ':CocList marketplace<CR>', { noremap = true, silent = true, nowait = true })

-- change color value
utils.nmap('<localleader>c', ':CocCommand editor.action.pickColor<CR>', { noremap = true, silent = true, nowait = true })
utils.nmap('<C-n>', ':CocCommand explorer<CR>')
