local utils = require("common.utils")
local nmap = utils.nmap

require("bufferline").setup({
  options = {
    diagnostics = "nvim_lsp",
    diagnostics_update_in_insert = false,
    diagnostics_indicator = function(count, level)
      local icon = level:match("error") and " " or " "
      return " " .. icon .. count
    end,
    show_buffer_close_icons = false,
    show_close_icon = false,
    show_tab_indicators = true,
    persist_buffer_sort = true,
    separator_style = "thin",
    sort_by = "insert_at_end",
    offsets = {
      {
        filetype = "NvimTree",
        text = vim.fn.fnamemodify(vim.fn.getcwd(), ":t"),
        text_align = "left",
      },
    },
  },
})

local persistbuffer = function(bufnr)
  bufnr = bufnr or vim.api.nvim_get_current_buf()
  vim.fn.setbufvar(bufnr, "bufpersist", 1)
end

vim.api.nvim_create_autocmd({ "BufRead" }, {
  group = vim.api.nvim_create_augroup("startup", {
    clear = false,
  }),
  pattern = { "*" },
  callback = function()
    vim.api.nvim_create_autocmd({ "InsertEnter", "BufModifiedSet" }, {
      buffer = 0,
      once = true,
      callback = function()
        persistbuffer()
      end,
    })
  end,
})

vim.keymap.set("n", "<A-a>", function()
  local curbufnr = vim.api.nvim_get_current_buf()
  local buflist = vim.api.nvim_list_bufs()
  for _, bufnr in ipairs(buflist) do
    if vim.bo[bufnr].buflisted and bufnr ~= curbufnr and (vim.fn.getbufvar(bufnr, "bufpersist") ~= 1) then
      vim.cmd("bd " .. tostring(bufnr))
    end
  end
end, { silent = true, desc = "Close unused buffers" })

nmap("<C-W>q", "<CMD>bp <BAR> bd #<CR>")
nmap("<C-W><C-q>", "<CMD>bp <BAR> bd #<CR>")
nmap("<C-q>", "<CMD>bp <BAR> bd #<CR>")
nmap("<A-q>", "<CMD>bp <BAR> bd #<CR>")
nmap("<A-,>", "<CMD>BufferLineCyclePrev<CR>")
nmap("<A-.>", "<CMD>BufferLineCycleNext<CR>")
-- nmap("<A-a>", "<CMD>BufferLineCloseLeft<CR> <CMD>BufferLineCloseRight<CR>")
