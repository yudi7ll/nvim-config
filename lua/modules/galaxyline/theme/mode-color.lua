local colors = require('modules.galaxyline.theme.colors')

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

return mode_color
