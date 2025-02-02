local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.color_scheme = "Catppuccin Mocha"
config.enable_tab_bar = false
config.window_decorations = "None"
config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}

config.font = wezterm.font_with_fallback({
	{
		family = "JetBrainsMono Nerd Font",
	},
	{
		family = "Kanit",
	},
})
config.font_size = 11.0

config.ssh_domains = {
	{
		name = "mc.ofbas",
		remote_address = "ddns.ofbas.com:23",
		username = "basu",

		multiplexing = "None",
	},
}

return config
