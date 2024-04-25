local wezterm = require('wezterm')
require('events')

return {
  -- font = wezterm.font("Iosevka"),
  harfbuzz_features = { 'calt=0', 'clig=0', 'liga=0' },
  -- font_size = 18.0,
  font_size = 15.0,
  command_palette_font_size = 15.0,
  command_palette_bg_color = "Black",
  command_palette_fg_color = "#dcd7ba",
  window_decorations = "RESIZE",
  use_fancy_tab_bar = false,
  adjust_window_size_when_changing_font_size = false,
  audible_bell = "Disabled",
  force_reverse_video_cursor = true,
  color_scheme = "Kanagawa (Gogh)",
  leader = { key = 'q', mods = 'CTRL', timeout_milliseconds = 1000 },
  keys = require("keys"),
  enable_scroll_bar = true,
}
