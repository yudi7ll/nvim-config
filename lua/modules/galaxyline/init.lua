local gl = require('galaxyline')
local condition = require('galaxyline.condition')

local gls = gl.section
local buffer_not_empty = condition.buffer_not_empty
local check_width = condition.hide_in_width;

-- vim.cmd("set statusline=%#GalaxyBufferType#%{luaeval('require(\"galaxyline\").component_decorator')(\"BufferType\")}%#BufferTypeSeparator# %=%#BufferIconSeparator#%#GalaxyBufferIcon#%{luaeval('require(\"galaxyline\").component_decorator')(\"BufferIcon\")}")

-- Colors
local colors = {
  bg         = '#282a36',
  fg         = '#f8f8f2',
  section_bg = '#38393f',
  yellow     = '#f1fa8c',
  cyan       = '#8be9fd',
  green      = '#50fa7b',
  orange     = '#ffb86c',
  magenta    = '#ff79c6',
  blue       = '#8be9fd',
  red        = '#ff5555'
}

local mode_color = function()
  local mode_colors = {
    n = colors.cyan,
    i = colors.green,
    c = colors.orange,
    V = colors.magenta,
    [''] = colors.magenta,
    v = colors.magenta,
    R = colors.red,
    s = colors.blue,
    t = colors.yellow,
  }

  return mode_colors[vim.fn.mode()]
end

gl.short_line_list = {'nerdtree', 'NvimTree', 'vista', 'dbui', 'packer', 'help', 'fern', 'floaterm'}

-- Left side
gls.left = {
  {
    FirstElement = {
      provider = function() return '▋' end,
      highlight = { colors.cyan, colors.section_bg }
    }
  },
  {
    ViMode = {
      provider = function()
        local alias = {
          n = 'NORMAL',
          i = 'INSERT',
          c = 'COMMAND',
          V = 'VISUAL',
          [''] = 'VISUAL',
          v = 'VISUAL',
          R = 'REPLACE',
          s = 'SNIPPET',
          t = 'TERMINAL',
        }
        vim.api.nvim_command('hi GalaxyViMode guifg='..mode_color())
        return alias[vim.fn.mode()]..' '
      end,
      highlight = { colors.bg, colors.bg },
      separator = "  ",
      separator_highlight = {colors.bg, colors.section_bg},
    },
  },
  {
    FileIcon = {
      provider = 'FileIcon',
      condition = buffer_not_empty,
      highlight = { require('galaxyline.provider_fileinfo').get_file_icon_color, colors.section_bg },
    }
  },
  {
    FileName = {
      provider = { 'FileName' },
      condition = buffer_not_empty,
      highlight = { colors.fg, colors.section_bg },
      separator = " ",
      separator_highlight = {colors.section_bg, colors.bg},
    }
  },
  {
    GitIcon = {
      provider = function() return '  ' end,
      condition = buffer_not_empty,
      highlight = {colors.red,colors.bg},
    }
  },
  {
    GitBranch = {
      provider = 'GitBranch',
      condition = buffer_not_empty,
      highlight = {colors.fg,colors.bg},
    }
  },
  {
    SpaceInverted = {
      provider = function () return ' ' end,
      highlight = {colors.bg,colors.bg},
    }
  },
  {
    DiffAdd = {
      provider = 'DiffAdd',
      condition = check_width,
      icon = '  ',
      highlight = { colors.green, colors.bg },
    }
  },
  {
    DiffModified = {
      provider = 'DiffModified',
      condition = check_width,
      icon = '  ',
      highlight = { colors.orange, colors.bg },
    }
  },
  {
    DiffRemove = {
      provider = 'DiffRemove',
      condition = check_width,
      icon = '  ',
      highlight = { colors.red,colors.bg },
    }
  },
  {
    LeftEnd = {
      provider = function() return '  ' end,
      condition = check_width,
      highlight = { colors.section_bg,colors.bg }
    }
  },
  {
    DiagnosticError = {
      provider = 'DiagnosticError',
      icon = '   ',
      highlight = {colors.red,colors.section_bg}
    }
  },
  {
    Space = {
      provider = function () return ' ' end,
      highlight = {colors.section_bg,colors.section_bg},
    }
  },
  {
    DiagnosticWarn = {
      provider = 'DiagnosticWarn',
      icon = '  ',
      highlight = {colors.orange,colors.section_bg},
    }
  },
  {
    Space = {
      provider = function () return ' ' end,
      highlight = {colors.section_bg,colors.section_bg},
    }
  },
  {
    DiagnosticInfo = {
      provider = 'DiagnosticInfo',
      icon = '  ',
      highlight = {colors.blue,colors.section_bg},
      separator = ' ',
      separator_highlight = { colors.section_bg, colors.bg },
    }
  }
}

-- Right side
gls.right = {
  {
    CocStatus = {
      provider = function() return vim.fn['coc#status']() end,
      highlight = { colors.orange, colors.section_bg },
      separator =  " ",
      separator_highlight = { colors.bg,colors.section_bg },
    }
  },
  {
    FileFormat = {
      provider = 'FileTypeName',
      condition = check_width,
      highlight = { colors.fg, colors.section_bg },
      separator = " | ",
      separator_highlight = { colors.bg, colors.section_bg }
    }
  },
  {
    LineInfo = {
      provider = 'LineColumn',
      condition = buffer_not_empty,
      highlight = { colors.fg, colors.section_bg },
      separator = ' | ',
      separator_highlight = { colors.bg, colors.section_bg },
    },
  },
  {
    FileFormatIcon = {
      provider = 'FileFormat',
      condition = check_width,
      highlight = { colors.fg, colors.section_bg },
      separator = " | ",
      separator_highlight = { colors.bg, colors.section_bg }
    }
  },
  {
    RightSpace = {
      provider = function() return ' ' end,
      condition = buffer_not_empty,
      highlight = { colors.fg, colors.section_bg },
    }
  },
}

-- Short status line
gls.short_line_left = {
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
      highlight = { colors.yellow, colors.section_bg },
      separator = '',
      separator_highlight = { colors.section_bg, colors.bg },
    }
  }
}

-- Force manual load so that nvim boots with a status line
-- gl.load_galaxyline()
