local wezterm = require("wezterm")
local config = {}

-- Set theme
config.color_scheme = "Catppuccin Mocha"
config.window_background_opacity = 0.9

-- Config Fonts
config.font = wezterm.font("JetBrainsMono Nerd Font")
config.font_size = 11

-- Config UI elements
config.hide_tab_bar_if_only_one_tab = true
config.window_padding = { left = 3, right = 0, top = 3, bottom = 0 }

-- Set zsh as starting program
config.default_prog = { "/usr/bin/zsh" }

return config
