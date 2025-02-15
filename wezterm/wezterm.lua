local wezterm = require 'wezterm'
local config = wezterm.config_builder()

config.color_scheme = 'Tokyo Night Day'
config.font = wezterm.font 'Hack Nerd Font Mono'
config.font_size = 16
config.tab_bar_at_bottom = true
config.use_fancy_tab_bar = false

config.window_padding = {
  left = '1cell',
  right = '1cell',
}

return config
