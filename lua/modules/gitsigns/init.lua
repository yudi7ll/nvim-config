require("gitsigns").setup {
    signs = {
        add          = {hl = 'GitSignsAdd'   , text = " ", numhl = 'GitSignsAddNr'   , linehl = 'GitSignsAddLn'},
        change       = {hl = 'GitSignsChange', text = " ", numhl = 'GitSignsChangeNr', linehl = 'GitSignsChangeLn'},
        delete       = {hl = 'GitSignsDelete', text = '_',  numhl = 'GitSignsDeleteNr', linehl = 'GitSignsDeleteLn'},
        topdelete    = {hl = 'GitSignsDelete', text = '‾',  numhl = 'GitSignsDeleteNr', linehl = 'GitSignsDeleteLn'},
        changedelete = {hl = 'GitSignsChange', text = '~',  numhl = 'GitSignsChangeNr', linehl = 'GitSignsChangeLn'},
    },
    keymaps = {
        -- Default keymap options
        noremap = true,
        buffer = true,
        ["n ]c"] = {expr = true, '&diff ? \']c\' : \'<cmd>lua require"gitsigns".next_hunk()<CR>\''},
        ["n [c"] = {expr = true, '&diff ? \'[c\' : \'<cmd>lua require"gitsigns".prev_hunk()<CR>\''},
        ["n <leader>hs"] = '<cmd>lua require"gitsigns".stage_hunk()<CR>',
        ["n <leader>hu"] = '<cmd>lua require"gitsigns".undo_stage_hunk()<CR>',
        ["n <leader>hr"] = '<cmd>lua require"gitsigns".reset_hunk()<CR>',
        ["n <leader>hp"] = '<cmd>lua require"gitsigns".preview_hunk()<CR>',
        ["n <leader>hb"] = '<cmd>lua require"gitsigns".blame_line()<CR>'
    },
    use_decoration_api = false
}

local cmd = vim.cmd

cmd "hi clear DiffAdd"
cmd "hi clear DiffChange"
cmd "hi clear DiffModified"
cmd "hi clear DiffDelete"
cmd "hi DiffAdd guifg=#406183 guibg=NONE"
cmd "hi DiffChange guifg=#315551 guibg=NONE"
cmd "hi DiffModified guifg=#315551 guibg=NONE"
cmd "hi DiffDelete guifg=#b60909 guibg=NONE"
