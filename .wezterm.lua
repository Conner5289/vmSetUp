-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- or, changing the font size and color scheme.
config.font_size = 18
config.font = wezterm.font("firaCode Nerd Font Mono")
-- config.color_scheme = "Dark+"
config.color_scheme = "Dissonance (Gogh)"

-- Finally, return the configuration to wezterm:
config.keys = {
	{
		key = "h",
		mods = "ALT",
		action = wezterm.action.ActivateTabRelative(-1),
	},
	{
		key = "l",
		mods = "ALT",
		action = wezterm.action.ActivateTabRelative(1),
	},
	{
		key = "h",
		mods = "SHIFT|ALT",
		action = wezterm.action.MoveTabRelative(-1),
	},
	{
		key = "l",
		mods = "SHIFT|ALT",
		action = wezterm.action.MoveTabRelative(1),
	},
	{
		key = "n",
		mods = "SHIFT|CTRL",
		action = wezterm.action.SendString("nvim\n"),
	},
}

return config
