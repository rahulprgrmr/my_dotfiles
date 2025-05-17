-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
config.color_scheme = "Catppuccin Mocha (Gogh)"
config.color_scheme = "Monokai Pro Ristretto (Gogh)"
-- config.color_scheme = "Gruvbox dark, medium (base16)"
-- config.color_scheme = "Nord (Arctic)"
-- config.color_scheme = "Tokyo Night (Gogh)"
config.line_height = 1.2
config.font_size = 12

config.font = wezterm.font_with_fallback({
	"MesloLGS Nerd Font Mono",
	"JetBrainsMono Nerd Font",
	"Noto Color Emoji", -- for emojis
	"FiraCode Nerd Font",
})

config.colors = {
	cursor_bg = "white",
	cursor_border = "white",
}

config.enable_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true
config.window_background_opacity = 0.9
-- config.window_padding = {
-- 	top = 0,
-- 	right = 0,
-- 	bottom = 0,
-- 	left = 0,
-- }
config.max_fps = 120
config.warn_about_missing_glyphs = false
config.window_close_confirmation = "NeverPrompt"
-- and finally, return the configuration to wezterm
return config
