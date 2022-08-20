local condition = require('galaxyline.condition')
local gls = require('galaxyline').section
local fileinfo = require('modules.galaxyline.provider.fileinfo')
local colors = require('modules.galaxyline.theme.colors')
local mode_color = require('modules.galaxyline.theme.mode-color')
-- local gps = require('nvim-gps')

local buffer_not_empty = condition.buffer_not_empty
local check_width = function() return condition.hide_in_width and buffer_not_empty end

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
    }
  },
  -- {
  --   CurrentFunction = {
  --     provider = require('lsp-status').current_function,
  --     condition = function ()
  --       buffer_not_empty()
  --       -- return check_width() and gps.is_available() and string.len(gps.get_location()) > 1
  --     end,
  --     highlight = { colors.Cyan, colors.section_bg },
  --   }
  -- },
  {
    Space1 = {
      provider = function() return ' ' end,
      highlight = { colors.section_bg, colors.bg }
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
}
