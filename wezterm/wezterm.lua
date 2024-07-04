local events = require("events")
local keybinds = require("keybinds")
local wezterm = require("wezterm")
local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end

config = {
  font_size = 12.0,
  font = wezterm.font_with_fallback({
    { family = "Hack Nerd Font" },
  }),
  -- color_scheme = 'tokyonight',
  color_scheme = "kanagawabones",
  window_background_opacity = 0.9,
  macos_window_background_blur = 10,
  window_padding = {
    left = 2,
    right = 0,
    top = 0,
    bottom = 0,
  },
  window_decorations = "TITLE | RESIZE",
  inactive_pane_hsb = {
    saturation = 0.8,
    brightness = 0.7,
  },
  leader = keybinds.leader,
  disable_default_key_bindings = true,
  keys = keybinds.create_keybinds(),
  key_tables = keybinds.key_tables,
  use_ime = true,
}

return config
