local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.color_scheme = "Catppuccin Mocha"

config.font = wezterm.font("ComicCodeLigatures Nerd Font Mono")
config.font_size = 13

config.enable_tab_bar = false

config.window_decorations = "RESIZE"

config.window_background_opacity = 0.85
config.macos_window_background_blur = 11
config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}

config.strikethrough_position = 22

return config
