local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.color_scheme = "Catppuccin Mocha"

config.font = wezterm.font("ComicCodeLigatures Nerd Font Mono", { weight = "Medium" })
config.font_size = 13

config.enable_tab_bar = false

config.window_decorations = "RESIZE"

config.window_background_opacity = 0.85
config.macos_window_background_blur = 30
config.window_padding = {
	left = 15,
	right = 15,
	top = 15,
	bottom = 15,
}

return config
