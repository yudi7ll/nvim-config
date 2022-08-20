require('nvim_comment').setup({
  comment_empty = false,
  hook = require("ts_context_commentstring.internal").update_commentstring
})
