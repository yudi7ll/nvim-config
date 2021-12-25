local utils = require("common.utils")
local xmap = utils.xmap
local nmap = utils.nmap

-- a
xmap("<leader>ac", "<Plug>(coc-codeaction)")
nmap("<leader>ac", "<Plug>(coc-codeaction)")
xmap("<leader>af", "<Plug>(coc-fix-current)")
nmap("<leader>af", "<Plug>(coc-fix-current)")
xmap("<leader>aF", "<Plug>(coc-format-selected)")
nmap("<leader>aF", "<Plug>(coc-format-selected)")
xmap("<leader>aS", "<Plug>(coc-range-select)")
nmap("<leader>aS", "<Plug>(coc-range-select)")
xmap("<leader>as", "<Plug>(coc-codeaction-selected)")
nmap("<leader>as", "<Plug>(coc-codeaction-selected)")
nmap("<leader>ar", "<Plug>(coc-rename)")

-- c
nmap("<leader>cd", ":CocList diagnostics<CR>")
nmap("<leader>ce", ":CocList extensions<CR>", { noremap = true, silent = true, nowait = true })
nmap("<leader>cf", ":Format<CR>", { noremap = true, silent = true, nowait = true })
nmap("<leader>cF", ":OR<CR>", { noremap = true, silent = true, nowait = true })
nmap("<leader>cc", ":CocList commands<CR>", { noremap = true, silent = true, nowait = true })
nmap("<leader>co", ":CocList outline<CR>", { noremap = true, silent = true, nowait = true })
nmap("<leader>cs", ":CocList -I symbols<CR>", { noremap = true, silent = true, nowait = true })
nmap("<leader>cj", ":CocNext<CR>", { noremap = true, silent = true, nowait = true })
nmap("<leader>ck", ":CocPrev<CR>", { noremap = true, silent = true, nowait = true })
nmap("<leader>cp", ":CocListResume<CR>", { noremap = true, silent = true, nowait = true })

-- GoTo code navigation.
nmap("gd", "<Plug>(coc-definition)")
nmap("gy", "<Plug>(coc-type-definition)")
nmap("gi", "<Plug>(coc-implementation)")
nmap("gr", "<Plug>(coc-references)")

-- Navigate diagnostics of current buffer
nmap("gN", "<Plug>(coc-diagnostic-prev)")
nmap("gn", "<Plug>(coc-diagnostic-next)")

-- coc marketplace
nmap("<leader>m", ":CocList marketplace<CR>", { noremap = true, silent = true, nowait = true })
nmap("<localleader>cc", ":CocCommand editor.action.pickColor<CR>", { noremap = true, silent = true })
nmap("<localleader>cm", ":CocCommand editor.action.colorPresentation<CR>", { noremap = true, silent = true })
