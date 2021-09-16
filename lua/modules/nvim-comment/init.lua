require('nvim_comment').setup({
  comment_empty = false,
  hook = function()
    require("ts_context_commentstring.internal").update_commentstring()
  end,
})
