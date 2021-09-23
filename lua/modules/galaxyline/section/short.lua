local gl = require('galaxyline')
local gls = gl.section
local colors = require('modules.galaxyline.theme.colors')

gl.short_line_list = {'nerdtree', 'NvimTree', 'vista', 'dbui', 'packer', 'help', 'fern', 'floaterm', 'coc-explorer'}

-- Short status line
gls.short_line_left = {
  {
    LeftGap = {
      provider = function() return ' ' end,
      highlight = { colors.section_bg, colors.section_bg }
    },
  },
  {
    BufferType = {
      provider = 'FileTypeName',
      highlight = { colors.fg, colors.section_bg },
    }
  },
  {
    ShortSpace = {
      provider = function() return ' ' end,
      highlight = { colors.section_bg, colors.section_bg },
      separator = ' ',
      separator_highlight = { colors.section_bg, colors.bg },
    }
  },
}

gls.short_line_right = {
  {
    BufferIcon = {
      provider= 'BufferIcon',
      highlight = { colors.Yellow, colors.section_bg },
      separator = '',
      separator_highlight = { colors.section_bg, colors.bg },
    }
  }
}
