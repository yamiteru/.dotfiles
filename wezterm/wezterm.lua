local wezterm = require 'wezterm'
local config = wezterm.config_builder()

config.color_scheme = 'Tokyo Night Day'
config.font = wezterm.font 'Hack Nerd Font Mono'
config.font_size = 16
config.tab_bar_at_bottom = true
config.use_fancy_tab_bar = false
config.max_fps = 120
config.exit_behavior_messaging = 'None'
config.exit_behavior = 'Close'
config.cursor_blink_rate = 0
config.adjust_window_size_when_changing_font_size = false
config.window_close_confirmation = 'NeverPrompt'

config.window_padding = {
  left = '1cell',
  right = '1cell',
}

return config
