local wezterm = require("wezterm")

wezterm.on('update-status', function(window, pane)
  window:set_left_status(wezterm.format {
    { Attribute = { Intensity = 'Bold' } },
    { Text = ' ' .. wezterm.mux.get_active_workspace() .. ' ' },
  })
end)

return {
  font = wezterm.font("Iosevka"),
  -- font = wezterm.font("Iosevka", { weight = "Light" }),
  font_size = 18.0,
  command_palette_font_size = 16.0,
  command_palette_bg_color = "Black",
  command_palette_fg_color = "#dcd7ba",
  window_decorations = "RESIZE",
  use_fancy_tab_bar = false,
  adjust_window_size_when_changing_font_size = false,
  audible_bell = "Disabled",
  force_reverse_video_cursor = true,
  color_scheme = "Kanagawa (Gogh)",
  leader = { key = 'a', mods = 'CTRL', timeout_milliseconds = 1000 },
  keys = require("keys"),
}
