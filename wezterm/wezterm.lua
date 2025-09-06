require("events")
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
  -- color_scheme = "tokyonight_moon",
  color_scheme = "Tokyo Night Moon",
  -- color_scheme = "tokyonight_night",
  -- color_scheme = "kanagawabones",
  window_background_opacity = 0.9,
  macos_window_background_blur = 10,
  window_padding = {
    left = 2,
    right = 0,
    top = 0,
    bottom = 0,
  },
  -- window_decorations = "RESIZE",
  show_tabs_in_tab_bar = true,
  -- window_frame = {
  -- inactive_titlebar_bg = "none",
  -- active_titlebar_bg = "none",
  -- },
  show_new_tab_button_in_tab_bar = false,
  -- show_close_tab_button_in_tabs = false,
  colors = {
    tab_bar = {
      inactive_tab_edge = "none",
    },
  },
  inactive_pane_hsb = {
    saturation = 0.8,
    brightness = 0.7,
  },
  leader = keybinds.leader,
  disable_default_key_bindings = true,
  keys = keybinds.create_keybinds(),
  key_tables = keybinds.key_tables,
  use_ime = true,
  scrollback_lines = 3500,
  quick_select_patterns = {
    '[0-9a-zA-Z]+[._-][0-9a-zA-Z._-]+',
  }
}

return config
