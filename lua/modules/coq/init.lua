local coq = require("coq")

-- Set recommended to false
-- vim.opt.coq_settings = {
--   keymap = {
--     recommended = false
--   }
-- }

-- local opt = {noremap = true, silent = true}


-- " Keybindings
-- ino <silent><expr> <Esc>   pumvisible() ? "\<C-e><Esc>" : "\<Esc>"
-- ino <silent><expr> <C-c>   pumvisible() ? "\<C-e><C-c>" : "\<C-c>"
-- ino <silent><expr> <BS>    pumvisible() ? "\<C-e><BS>"  : "\<BS>"
-- ino <silent><expr> <CR>    pumvisible() ? (complete_info().selected == -1 ? "\<C-e><CR>" : "\<C-y>") : "\<CR>"
-- ino <silent><expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
-- ino <silent><expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<BS>"

coq.Now();
