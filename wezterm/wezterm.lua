local wezterm = require "wezterm"
local config = {}

-- Set theme
config.color_scheme = "Catppuccin Mocha"

-- Config Fonts
config.font = wezterm.font('JetBrainsMono Nerd Font')
config.font_size = 11

-- Config UI elements
config.hide_tab_bar_if_only_one_tab = true

-- Set zsh as starting program
config.default_prog = { '/usr/bin/zsh' }

return config
