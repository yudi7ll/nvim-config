local saga = require("lspsaga")
local saga_diagnostic = require("lspsaga.diagnostic")

saga.init_lsp_saga({
  -- debug = false,
  -- use_saga_diagnostic_sign = false,
  -- -- diagnostic sign
  -- error_sign = "",
  -- warn_sign = "",
  -- hint_sign = "",
  -- infor_sign = "",
  -- diagnostic_header_icon = "   ",
  -- -- code action title icon
  -- code_action_icon = " ",
  -- code_action_prompt = {
  --   enable = true,
  --   sign = true,
  --   sign_priority = 40,
  --   virtual_text = true,
  -- },
  -- finder_definition_icon = "  ",
  -- finder_reference_icon = "  ",
  -- max_preview_lines = 10,
  -- finder_action_keys = {
  --   open = { "<CR>", "l" },
  --   vsplit = "s",
  --   split = "i",
  --   quit = { "q", "<ESC>" },
  --   scroll_down = "<A-j>",
  --   scroll_up = "<A-k>",
  -- },
  -- code_action_keys = {
  --   quit = { "<ESC>", "q" },
  --   exec = "<CR>",
  -- },
  -- rename_action_keys = {
  --   quit = { "<ESC>", "q" },
  --   exec = "<CR>",
  -- },
  -- definition_preview_icon = "  ",
  -- border_style = "single",
  -- rename_prompt_prefix = "➤",
  -- rename_output_qflist = {
  --   enable = false,
  --   auto_open_qflist = false,
  -- },
  -- server_filetype_map = {},
  -- diagnostic_prefix_format = "%d. ",
  -- diagnostic_message_format = "%m %c",
  -- highlight_prefix = false,
})

vim.diagnostic.config({ virtual_text = false })

local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

local au_cursor_diagnostic = vim.api.nvim_create_augroup("CursorDiagnostic", { clear = true })
vim.api.nvim_create_autocmd({"CursorHold", "CursorHoldI", "CursorMoved"}, {
  callback = saga_diagnostic.show_cursor_diagnostics,
  group = au_cursor_diagnostic,
})

vim.cmd([[
  augroup lspsaga_filetypes
    autocmd!
    autocmd FileType sagahover nnoremap <buffer><nowait><silent> <Esc> <cmd>close!<cr>
  augroup END
]])
