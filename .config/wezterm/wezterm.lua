local wezterm = require("wezterm")
local session_manager = require("wezterm-session-manager/session-manager")
local smart_splits = wezterm.plugin.require("https://github.com/mrjones2014/smart-splits.nvim")
local config = wezterm.config_builder()

config.enable_wayland = false
-- Enhanched Session Manager events
-- https://github.com/danielcopper/wezterm-session-manager
wezterm.on("save_session", function(window)
	session_manager.save_state(window)
end)
wezterm.on("load_session", function(window)
	session_manager.load_state(window)
end)
wezterm.on("restore_session", function(window)
	session_manager.restore_state(window)
end)

config.leader = { key = "a", mods = "CTRL", timeout_milliseconds = 1000 }

config.keys = {
	-- session manager
	{ key = "S", mods = "LEADER", action = wezterm.action({ EmitEvent = "save_session" }) },
	{ key = "L", mods = "LEADER", action = wezterm.action({ EmitEvent = "load_session" }) },
	{ key = "R", mods = "LEADER", action = wezterm.action({ EmitEvent = "restore_session" }) },

	-- splitting
	{ key = "-", mods = "LEADER", action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }) },
	{ key = "=", mods = "LEADER", action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }) },

	-- focus and zooming
	{ key = "m", mods = "LEADER", action = wezterm.action.TogglePaneZoomState },

	-- rotate panes
	{ key = "Space", mods = "LEADER", action = wezterm.action.RotatePanes("Clockwise") },
	{ key = "0", mods = "LEADER", action = wezterm.action.PaneSelect({ mode = "SwapWithActive" }) },
	{ key = "Enter", mods = "LEADER", action = wezterm.action.ActivateCopyMode },
}

-- navigation with smart splits plugin
-- https://github.com/mrjones2014/smart-splits.nvim#wezterm
smart_splits.apply_to_config(config, {
	direction_keys = { "h", "j", "k", "l" },
	modifiers = {
		move = "CTRL",
		resize = "META", -- ALT on Windows, Option on Mac
	},
})

-- appearance
config.font = wezterm.font("MesloLGS Nerd Font")
-- config.font = wezterm.font("JetBrainsMono Nerd Font")
-- config.color_scheme = "Gruvbox Material (Gogh)"
config.color_scheme = "gruvbox_material_dark_hard"
config.color_schemes = {
	["gruvbox_material_dark_hard"] = {
		foreground = "#D4BE98",
		background = "#1D2021",
		cursor_bg = "#D4BE98",
		cursor_border = "#D4BE98",
		cursor_fg = "#1D2021",
		selection_bg = "#D4BE98",
		selection_fg = "#3C3836",

		ansi = { "#1d2021", "#ea6962", "#a9b665", "#d8a657", "#7daea3", "#d3869b", "#89b482", "#d4be98" },
		brights = { "#eddeb5", "#ea6962", "#a9b665", "#d8a657", "#7daea3", "#d3869b", "#89b482", "#d4be98" },
	},
}

config.font_size = 18

config.enable_tab_bar = false

-- config.window_decorations = "RESIZE"
config.window_background_opacity = 0.75

return config
