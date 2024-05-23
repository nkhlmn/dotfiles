require('events')

return {
  font_size = 15.0,
  harfbuzz_features = { 'calt=0', 'clig=0', 'liga=0' },
  command_palette_font_size = 15.0,
  command_palette_bg_color = "Black",
  command_palette_fg_color = "#dcd7ba",
  window_decorations = "RESIZE",
  use_fancy_tab_bar = false,
  adjust_window_size_when_changing_font_size = false,
  audible_bell = "Disabled",
  force_reverse_video_cursor = true,
  color_schemes = require("color_schemes"),
  -- color_scheme = "nordic",
  -- color_scheme = "kanagawa-dragon",
  color_scheme = "Kanagawa (Gogh)",
  leader = { key = ' ', mods = 'ALT', timeout_milliseconds = 1000 },
  keys = require("keys"),
  enable_scroll_bar = true,
}
