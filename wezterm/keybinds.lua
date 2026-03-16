local M = {}
local utils = require("utils")
local wezterm = require("wezterm")
local act = wezterm.action
local session = require("session")

M.leader = { key = "j", mods = "SUPER" }

M.tmux_keybinds = {
  { key = "t", mods = "SUPER", action = act({ SpawnTab = "CurrentPaneDomain" }) },
  { key = "w", mods = "SUPER", action = act({ CloseCurrentTab = { confirm = true } }) },
  { key = "Tab", mods = "CTRL", action = act({ ActivateTabRelative = 1 }) },
  { key = "Tab", mods = "CTRL|SHIFT", action = act({ ActivateTabRelative = -1 }) },
}

M.default_keybinds = {
  {
    key = "r",
    mods = "LEADER",
    action = act.ActivateKeyTable({
      name = "resize_pane",
      one_shot = false,
    }),
  },
  {
    key = "a",
    mods = "LEADER",
    action = act.ActivateKeyTable({
      name = "activate_pane",
      one_shot = false,
    }),
  },
  {
    key = "f",
    mods = "LEADER",
    action = act.Search({
      CaseSensitiveString = "",
    }),
  },
  { key = "[", mods = "LEADER", action = act.ActivateCopyMode },
  { key = "]", mods = "LEADER", action = act.QuickSelect },
  {
    key = "\\",
    mods = "CTRL",
    action = act({
      SplitHorizontal = { domain = "CurrentPaneDomain" },
    }),
  },
  {
    key = "'",
    mods = "CTRL",
    action = act({
      SplitVertical = { domain = "CurrentPaneDomain" },
    }),
  },
  { key = "C", mods = "LEADER", action = act.ActivateCopyMode },
  { key = "c", mods = "SUPER", action = act({ CopyTo = "Clipboard" }) },
  { key = "v", mods = "SUPER", action = act({ PasteFrom = "Clipboard" }) },
  { key = "PageUp", mods = "CTRL", action = act({ ScrollByPage = -1 }) },
  { key = "PageDown", mods = "CTRL", action = act({ ScrollByPage = 1 }) },
  { key = "h", mods = "SUPER", action = act.HideApplication },
  { key = "-", mods = "CTRL", action = act.DecreaseFontSize },
  { key = "+", mods = "CTRL", action = act.IncreaseFontSize },
  { key = "0", mods = "CTRL", action = act.ResetFontSize },
  { key = "[", mods = "SUPER|CTRL", action = act.MoveTabRelative(-1) },
  { key = "]", mods = "SUPER|CTRL", action = act.MoveTabRelative(1) },
  { key = "P", mods = "CTRL", action = act.ActivateCommandPalette },
  { key = "l", mods = "ALT", action = act.ShowLauncher },
  -- Show workspace
  {
    key = "s",
    mods = "LEADER",
    action = act.ShowLauncherArgs({ flags = "WORKSPACES", title = "Select workspace" }),
  },
  -- Create new workspace
  {
    key = "S",
    mods = "LEADER|SHIFT",
    action = act.PromptInputLine({
      description = "(wezterm) Create new workspace:",
      action = wezterm.action_callback(function(window, pane, line)
        if line then
          window:perform_action(
            act.SwitchToWorkspace({
              name = line,
            }),
            pane
          )
        end
      end),
    }),
  },
  { key = "l", mods = "LEADER", action = act.SwitchWorkspaceRelative(1) },
  { key = "h", mods = "LEADER", action = act.SwitchWorkspaceRelative(-1) },
  -- Session manager: save (Alt+s)
  {
    key = "s",
    mods = "ALT",
    action = act.PromptInputLine({
      description = "(session) Save session (Enter to use workspace name):",
      action = wezterm.action_callback(function(window, _, line)
        local workspace = window:active_workspace()
        local name = (line and #line > 0) and line or workspace
        local ok, err = session.save_session(name, workspace)
        if ok then
          window:set_right_status(" Saved: " .. name .. " ")
        else
          window:set_right_status(" Save failed: " .. tostring(err) .. " ")
        end
      end),
    }),
  },
  -- Session manager: restore (Alt+r)
  {
    key = "r",
    mods = "ALT",
    action = wezterm.action_callback(function(window, pane)
      local names = session.list_sessions()
      if #names == 0 then
        window:set_right_status(" No saved sessions ")
        return
      end
      local choices = {}
      for _, name in ipairs(names) do
        table.insert(choices, { label = name, id = name })
      end
      window:perform_action(
        act.InputSelector({
          title = "Restore session",
          choices = choices,
          action = wezterm.action_callback(function(win, _, id, _)
            if id then
              local ok, err = session.restore_session(id, win:mux_window())
              if ok then
                win:set_right_status(" Restored: " .. id .. " ")
              else
                win:set_right_status(" Restore failed: " .. tostring(err) .. " ")
              end
            end
          end),
        }),
        pane
      )
    end),
  },
  -- Session manager: delete (Alt+d)
  {
    key = "d",
    mods = "ALT",
    action = wezterm.action_callback(function(window, pane)
      local names = session.list_sessions()
      if #names == 0 then
        window:set_right_status(" No saved sessions ")
        return
      end
      local choices = {}
      for _, name in ipairs(names) do
        table.insert(choices, { label = name, id = name })
      end
      window:perform_action(
        act.InputSelector({
          title = "Delete session",
          choices = choices,
          action = wezterm.action_callback(function(win, _, id, _)
            if id then
              local ok, err = session.delete_session(id)
              if ok then
                win:set_right_status(" Deleted: " .. id .. " ")
              else
                win:set_right_status(" Delete failed: " .. tostring(err) .. " ")
              end
            end
          end),
        }),
        pane
      )
    end),
  },
}

function M.create_keybinds()
  return utils.merge_lists(M.default_keybinds, M.tmux_keybinds)
end

M.key_tables = {
  resize_pane = {
    { key = "LeftArrow", action = act.AdjustPaneSize({ "Left", 1 }) },
    { key = "h", action = act.AdjustPaneSize({ "Left", 1 }) },
    { key = "RightArrow", action = act.AdjustPaneSize({ "Right", 1 }) },
    { key = "l", action = act.AdjustPaneSize({ "Right", 1 }) },
    { key = "UpArrow", action = act.AdjustPaneSize({ "Up", 1 }) },
    { key = "k", action = act.AdjustPaneSize({ "Up", 1 }) },
    { key = "DownArrow", action = act.AdjustPaneSize({ "Down", 1 }) },
    { key = "j", action = act.AdjustPaneSize({ "Down", 1 }) },
    -- Cancel the mode by pressing escape
    { key = "Escape", action = "PopKeyTable" },
  },
  activate_pane = {
    { key = "LeftArrow", action = act.ActivatePaneDirection("Left") },
    { key = "h", action = act.ActivatePaneDirection("Left") },
    { key = "RightArrow", action = act.ActivatePaneDirection("Right") },
    { key = "l", action = act.ActivatePaneDirection("Right") },
    { key = "UpArrow", action = act.ActivatePaneDirection("Up") },
    { key = "k", action = act.ActivatePaneDirection("Up") },
    { key = "DownArrow", action = act.ActivatePaneDirection("Down") },
    { key = "j", action = act.ActivatePaneDirection("Down") },
    -- Cancel the mode by pressing escape
    { key = "Escape", action = "PopKeyTable" },
  },
}

return M
