-- Right side
local condition = require('galaxyline.condition')
local gls = require('galaxyline').section
local fileinfo = require('modules.galaxyline.provider.fileinfo')
local buffer = require('galaxyline.provider_buffer')
local colors = require('modules.galaxyline.theme.colors')

local buffer_not_empty = condition.buffer_not_empty
local check_width = function() return condition.hide_in_width and buffer_not_empty end

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
    Space2 = {
      provider = function() return ' ' end,
      highlight = { colors.bg, colors.bg }
    }
  },
  {
    Spacing = {
      provider = function() return 'spaces '..vim.bo.shiftwidth end,
      condition = check_width,
      highlight = { colors.fg, colors.section_bg },
      separator =  " ",
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
