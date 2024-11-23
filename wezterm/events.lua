local wezterm = require("wezterm")

wezterm.on("format-window-title", function(tab, tabs)
  local zoomed = ""
  if tab.active_pane.is_zoomed then
    zoomed = "[Z] "
  end

  local index = ""
  if #tabs > 1 then
    index = string.format("[%d/%d] ", tab.tab_index + 1, #tabs)
  end

  return zoomed .. index .. tab.active_pane.title
end)

function tab_title(tab_info)
  local title = tab_info.tab_title
  -- if the tab title is explicitly set, take that
  if title and #title > 0 then
    return title
  end
  -- Otherwise, use the title from the active pane
  -- in that tab
  return tab_info.active_pane.title
end

local SOLID_LEFT_ARROW = wezterm.nerdfonts.ple_left_half_circle_thick
local SOLID_RIGHT_ARROW = wezterm.nerdfonts.ple_right_half_circle_thick

wezterm.on("format-tab-title", function(tab)
  local title = tab_title(tab)
  local background = "#5c6d74"
  local foreground = "##f0f0f0"
  local edge_background = "none"

  if tab.is_active then
    background = "#00c4cc"
    foreground = "#f0f0f0"
  end
  local edge_foreground = background

  return {
    { Background = { Color = edge_background } },
    { Foreground = { Color = edge_foreground } },
    { Text = SOLID_LEFT_ARROW },
    { Background = { Color = background } },
    { Foreground = { Color = foreground } },
    { Text = " " .. title .. " " },
    { Background = { Color = edge_background } },
    { Foreground = { Color = edge_foreground } },
    { Text = SOLID_RIGHT_ARROW },
  }
end)

return wezterm
