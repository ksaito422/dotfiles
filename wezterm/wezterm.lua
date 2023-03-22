local wezterm = require('wezterm')
local keybinds = require('keybinds')
local visual = require('visual')
local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

config = {
	font_size = visual.font_size,
	-- config.font = wezterm.font('HackGen35Nerd', {}),
	color_scheme = visual.color_scheme,

	window_background_opacity = visual.opacity,
	window_padding = visual.padding,

	leader = keybinds.leader,
	disable_default_key_bindings = true,
	keys = keybinds.create_keybinds(),
	key_tables = keybinds.key_tables,

	use_ime = true,
}

return config
