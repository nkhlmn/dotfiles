local wezterm = require("wezterm")
return {
	-- font = wezterm.font("Iosevka Nerd Font Mono", { weight = "Light" }),
	-- font_size = 18.0,

	-- font = wezterm.font("JetBrainsMono Nerd Font Mono", { weight = "Thin" }),
	-- font_size = 16.0,
  --
	font = wezterm.font("VictorMono Nerd Font Mono", { weight = "Light" }),
	font_size = 17.0,
  font_rules = {
    {
      italic = true,
      font = wezterm.font("VictorMono Nerd Font Mono", { weight = "Light", style = "Oblique" })
    }
  },

  harfbuzz_features = { 'calt=0', 'clig=0', 'liga=0' },
	window_decorations = "RESIZE",
	hide_tab_bar_if_only_one_tab = true,
	adjust_window_size_when_changing_font_size = false,
	audible_bell = "Disabled",
	color_scheme = "kanagawa",
	-- color_scheme = "gruvbox_material_dark_hard",
	force_reverse_video_cursor = true,
	color_schemes = require("color_schemes"),
}
