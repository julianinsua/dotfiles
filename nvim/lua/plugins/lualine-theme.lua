-- My custom theme for lualine, be mercifull I'm doing my best here
local catpuccin = {
  rosewater = '#f5e0dc',
  flamingo  = '#f2cdcd',
  pink      = '#f5c2e7',
  mauve     = '#cba6f7',
  red       = '#f38ba8',
  maroon    = '#eba0ac',
  peach     = '#fab387',
  yellow    = '#f9e2af',
  green     = '#a6e3a1',
  teal      = '#94e2d5',
  sky       = '#89dceb',
  sapphire  = '#74c7ec',
  blue      = '#89b4fa',
  lavender  = '#b4befe',
  text      = '#cdd6f4',
  subtext1  = '#bac2de',
  subtext0  = '#a6adc8',
  overlay2  = '#9399b2',
  overlay1  = '#7f849c',
  overlay0  = '#6c7086',
  surface2  = '#585b70',
  surface1  = '#45475a',
  surface0  = '#313244',
  base      = '#1e1e2e',
  mantle    = '#181825',
  crust     = '#11111b',
}

return {
  normal = {
    a = { bg = catpuccin.surface1, fg = catpuccin.mauve, gui = 'bold' },
    b = { bg = catpuccin.surface0, fg = catpuccin.subtext0 },
    c = { bg = catpuccin.base, fg = catpuccin.text },
    z = { bg = catpuccin.lavender, fg = catpuccin.base, gui = 'bold' }
  },
  insert = {
    a = { bg = catpuccin.surface1, fg = catpuccin.blue, gui = 'bold' },
    b = { bg = catpuccin.surface0, fg = catpuccin.subtext0 },
    c = { bg = catpuccin.base, fg = catpuccin.text },
    z = { bg = catpuccin.sapphire, fg = catpuccin.base, gui = 'bold' }
  },
  visual = {
    a = { bg = catpuccin.surface1, fg = catpuccin.yellow, gui = 'bold' },
    b = { bg = catpuccin.surface0, fg = catpuccin.subtext0 },
    c = { bg = catpuccin.base, fg = catpuccin.text },
    z = { bg = catpuccin.flamingo, fg = catpuccin.base, gui = 'bold' }
  },
  replace = {
    a = { bg = catpuccin.surface1, fg = catpuccin.red, gui = 'bold' },
    b = { bg = catpuccin.surface0, fg = catpuccin.subtext0 },
    c = { bg = catpuccin.base, fg = catpuccin.text },
    z = { bg = catpuccin.pink, fg = catpuccin.base, gui = 'bold' }
  },
  command = {
    a = { bg = catpuccin.surface1, fg = catpuccin.green, gui = 'bold' },
    b = { bg = catpuccin.surface0, fg = catpuccin.subtext0 },
    c = { bg = catpuccin.base, fg = catpuccin.text },
    z = { bg = catpuccin.teal, fg = catpuccin.base, gui = 'bold' }
  },
  inactive = {
    a = { bg = catpuccin.base, fg = catpuccin.subtext0, gui = 'bold' },
    b = { bg = catpuccin.base, fg = catpuccin.subtext0 },
    c = { bg = catpuccin.base, fg = catpuccin.subtext0 },
    x = { bg = catpuccin.base, fg = catpuccin.subtext0, gui = 'bold' }
  }
}
