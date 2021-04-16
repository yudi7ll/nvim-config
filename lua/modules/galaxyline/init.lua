local gl = require('galaxyline')
local condition = require('galaxyline.condition')

-- Provider
local buffer = require('galaxyline.provider_buffer')
local fileinfo = require('modules.galaxyline.provider.fileinfo')

local gls = gl.section
local buffer_not_empty = condition.buffer_not_empty
local check_width = function()
  return condition.hide_in_width and buffer_not_empty
end


-- Colors
local colors = require('modules.galaxyline.provider.theme').default

local mode_color = function()
  local mode_colors = {
    n = colors.Cyan,
    i = colors.Green,
    c = colors.Orange,
    V = colors.Magenta,
    [''] = colors.Magenta,
    v = colors.Magenta,
    R = colors.Red,
    s = colors.Blue,
    t = colors.Yellow,
  }

  return mode_colors[vim.fn.mode()]
end

gl.short_line_list = {'nerdtree', 'NvimTree', 'vista', 'dbui', 'packer', 'help', 'fern', 'floaterm'}

-- Left side
gls.left = {
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
        return '▊ '..alias[vim.fn.mode()]..' '
      end,
      highlight = { colors.Red, colors.bg },
      separator = " ",
      separator_highlight = {colors.bg, colors.section_bg},
    },
  },
  {
    FileIcon = {
      provider = 'FileIcon',
      condition = buffer_not_empty,
      highlight = { fileinfo.get_file_icon_color, colors.section_bg },
    }
  },
  {
    FileName = {
      provider = 'FileName',
      condition = buffer_not_empty,
      highlight = { colors.fg, colors.section_bg },
      separator = "",
      separator_highlight = {colors.section_bg, colors.bg},
    }
  },
  {
    GitIcon = {
      provider = function() return '  ' end,
      condition = buffer_not_empty,
      highlight = {colors.Red,colors.bg},
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
      condition = buffer_not_empty,
      highlight = {colors.bg,colors.bg},
    }
  },
  {
    DiffAdd = {
      provider = 'DiffAdd',
      condition = check_width,
      icon = '  ',
      highlight = { colors.Green, colors.bg },
    }
  },
  {
    DiffModified = {
      provider = 'DiffModified',
      condition = check_width,
      icon = '  ',
      highlight = { colors.Orange, colors.bg },
    }
  },
  {
    DiffRemove = {
      provider = 'DiffRemove',
      condition = check_width,
      icon = '  ',
      highlight = { colors.Red,colors.bg },
    }
  },
  {
    VistaPlugin = {
      provider = function()
        if (vim.b.vista_nearest_method_or_function == nil) then
          return ''
        elseif (vim.b.vista_nearest_method_or_function == '') then
          return ''
        else
          return vim.b.vista_nearest_method_or_function .. ' '
        end
      end,
      condition = check_width,
      icon = '   -> ',
      highlight = { colors.Orange, colors.bg, 'bold' },
    }
  },
}

-- Right side
gls.right = {
  {
    DiagnosticError = {
      provider = 'DiagnosticError',
      condition = buffer_not_empty,
      icon = '  ',
      highlight = {colors.Red,colors.bg}
    },
  },
  {
    DiagnosticWarn = {
      provider = 'DiagnosticWarn',
      condition = buffer_not_empty,
      icon = '   ',
      highlight = {colors.Orange,colors.bg},
    },
  },
  {
    DiagnosticInfo = {
      provider = 'DiagnosticInfo',
      condition = buffer_not_empty,
      icon = '   ',
      highlight = {colors.Blue,colors.bg},
    },
  },
  {
    DiagnosticHint = {
      provider = 'DiagnosticHint',
      condition = buffer_not_empty,
      icon = '   ',
      highlight = {colors.Blue,colors.bg},
    },
  },
  {
    Space = {
      provider = function() return ' ' end,
      highlight = { colors.bg, colors.bg }
    }
  },
  {
    LineInfo = {
      provider = 'LineColumn',
      condition = buffer_not_empty,
      highlight = { colors.fg, colors.section_bg },
      separator =  " ",
      separator_highlight = { colors.bg, colors.section_bg },
    },
  },
  {
    Spacing = {
      provider = function() return 'spaces '..vim.api.nvim_buf_get_option(0, 'shiftwidth') end,
      condition = buffer_not_empty,
      highlight = { colors.fg, colors.section_bg },
      separator = ' | ',
      separator_highlight = { colors.bg, colors.section_bg },
    },
  },
  {
    Icon = {
      provider = 'FileIcon',
      condition = check_width,
      highlight = { fileinfo.get_file_icon_color, colors.section_bg },
      separator = " | ",
      separator_highlight = { colors.bg, colors.section_bg }
    },
  },
  {
    FileFormat = {
      provider = function() return buffer.get_buffer_filetype():lower() end,
      condition = check_width,
      highlight = { colors.fg, colors.section_bg },
    }
  },
  {
    CocStatus = {
      provider = function() return vim.fn['coc#status']() end,
      highlight = { colors.fg, colors.section_bg },
      separator = ' | ',
      separator_highlight = { colors.bg, colors.section_bg },
    }
  },
  {
    RightGap = {
      provider = function() return ' ' end,
      highlight = { colors.section_bg, colors.section_bg }
    },
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
      highlight = { colors.Yellow, colors.section_bg },
      separator = '',
      separator_highlight = { colors.section_bg, colors.bg },
    }
  }
}

-- Force manual load so that nvim boots with a status line
-- gl.load_galaxyline()
vim.api.nvim_command('autocmd VimEnter * call vista#RunForNearestMethodOrFunction()')
