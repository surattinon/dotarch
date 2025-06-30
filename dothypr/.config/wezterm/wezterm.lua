local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.default_prog = { os.getenv("HOME") .. "/.config/wezterm/scripts/tmux-wezterm" }

local custom = wezterm.color.get_builtin_schemes()["Catppuccin Mocha"]
custom.background = "#141414"

config.color_schemes = { ["Custom Catppuccin"] = custom }
config.color_scheme = "Custom Catppuccin"

config.window_background_opacity = 0.4
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
config.font_size = 10.5

config.ssh_domains = {
	{
		name = "webserver",
		remote_address = "ddns.ofbas.com:26",
		username = "basu",

		multiplexing = "None",
	},
}

return config
