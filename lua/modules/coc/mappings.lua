local utils = require("common.utils")
local xmap = utils.xmap
local nmap = utils.nmap

nmap("<leader>lr", "<CMD>CocRestart<CR>")

-- a
xmap("<leader>ac", "<Plug>(coc-codeaction)")
nmap("<leader>ac", "<Plug>(coc-codeaction)")
nmap("<leader>af", "<CMD>Format<CR>", { nowait = true })
xmap("<leader>aF", "<Plug>(coc-format-selected)")
nmap("<leader>aF", "<Plug>(coc-format-selected)")
nmap("<leader>ao", "<CMR>OR<CR>", { nowait = true })
xmap("<leader>aS", "<Plug>(coc-range-select)")
nmap("<leader>aS", "<Plug>(coc-range-select)")
xmap("<leader>as", "<Plug>(coc-codeaction-selected)")
nmap("<leader>as", "<Plug>(coc-codeaction-selected)")
nmap("<leader>ar", "<Plug>(coc-rename)")
nmap("<leader>al", "<Plug>(coc-codelens-action)")

-- c
xmap("<leader>cf", "<Plug>(coc-fix-current)")
nmap("<leader>cf", "<Plug>(coc-fix-current)")
nmap("<leader>cd", "<CMD>CocList diagnostics<CR>")
nmap("<leader>ce", "<CMD>CocList extensions<CR>", { nowait = true })
nmap("<leader>cc", "<CMD>CocList commands<CR>", { nowait = true })
nmap("<leader>cl", "<Plug>(coc-codelens-action)")
nmap("<leader>co", "<CMD>CocList outline<CR>", { nowait = true })
nmap("<leader>cs", "<CMD>CocList -I symbols<CR>", { nowait = true })
nmap("<leader>cj", "<CMD>CocNext<CR>", { nowait = true })
nmap("<leader>ck", "<CMD>CocPrev<CR>", { nowait = true })
nmap("<leader>cp", "<CMD>CocListResume<CR>", { nowait = true })

-- GoTo code navigation.
nmap("gd", "<Plug>(coc-definition)")
nmap("gy", "<Plug>(coc-type-definition)")
nmap("gi", "<Plug>(coc-implementation)")
nmap("gr", "<Plug>(coc-references)")

-- Navigate diagnostics of current buffer
nmap("gN", "<Plug>(coc-diagnostic-prev)")
nmap("gn", "<Plug>(coc-diagnostic-next)")

-- coc marketplace
nmap("<leader>m", "<CMD>CocList marketplace<CR>", { nowait = true })
nmap("<localleader>cc", "<CMD>CocCommand editor.action.pickColor<CR>")
nmap("<localleader>cm", "<CMD>CocCommand editor.action.colorPresentation<CR>")
