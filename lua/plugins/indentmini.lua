---@module 'lazy'
---@type LazySpec
return {
  'nvimdev/indentmini.nvim',
  event = 'BufEnter',
  opts = {
    exclude = {
      'erlang',
      'markdown',
    }
  }
}
