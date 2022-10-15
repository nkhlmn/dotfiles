local wezterm = require("wezterm")
return {
	font = wezterm.font("Iosevka Nerd Font Mono", { weight = "ExtraLight" }),
	font_size = 18.0,
	window_decorations = "RESIZE",
	hide_tab_bar_if_only_one_tab = true,
	adjust_window_size_when_changing_font_size = false,
	audible_bell = "Disabled",
	color_scheme = "kanagawa",
	-- color_scheme = "gruvbox_material_dark_hard",
	force_reverse_video_cursor = true,
	color_schemes = require("color_schemes"),
}
