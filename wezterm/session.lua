local M = {}
local wezterm = require("wezterm")

-- ─── Constants ───────────────────────────────────────────────────────────────

M.SESSION_DIR = wezterm.home_dir .. "/wezterm-session"

-- ─── Internal helpers ────────────────────────────────────────────────────────

local function ensure_session_dir()
  os.execute("mkdir -p '" .. M.SESSION_DIR .. "'")
end

-- Resolves a URI object from pane:get_current_working_dir() to a plain path.
local function resolve_cwd(uri)
  if uri and uri.file_path and #uri.file_path > 0 then
    return uri.file_path
  end
  return wezterm.home_dir
end

-- Infers split direction by comparing adjacent pane positions.
local function infer_split_direction(prev, curr)
  if curr.left > prev.left then
    return "Right"
  elseif curr.top > prev.top then
    return "Bottom"
  elseif curr.left < prev.left then
    return "Left"
  else
    return "Top"
  end
end

-- Computes the fractional size (0.0–1.0) of the new pane relative to the space.
local function infer_split_size(prev, curr, direction)
  if direction == "Right" or direction == "Left" then
    local total = prev.width + curr.width
    if total == 0 then return 0.5 end
    return curr.width / total
  else
    local total = prev.height + curr.height
    if total == 0 then return 0.5 end
    return curr.height / total
  end
end

-- Captures a single MuxWindow into a serialisable table.
local function capture_window(mux_win)
  local win_data = {
    workspace = mux_win:get_workspace(),
    tabs = {},
  }

  for _, tab in ipairs(mux_win:tabs()) do
    local tab_data = {
      title = tab:get_title(),
      is_active = false,
      panes = {},
    }

    for _, info in ipairs(tab:panes_with_info()) do
      local cwd_uri = info.pane:get_current_working_dir()
      table.insert(tab_data.panes, {
        title     = info.pane:get_title(),
        cwd       = resolve_cwd(cwd_uri),
        left      = info.left,
        top       = info.top,
        width     = info.width,
        height    = info.height,
        is_active = info.is_active,
        is_zoomed = info.is_zoomed,
      })
      if info.is_active then
        tab_data.is_active = true
      end
    end

    table.insert(win_data.tabs, tab_data)
  end

  return win_data
end

-- ─── Public: Save ────────────────────────────────────────────────────────────

-- Captures all windows belonging to workspace_name and writes to
-- ~/wezterm-session/<session_name>.json
-- session_name: filename for the saved session (defaults to workspace_name)
-- workspace_name: which workspace to capture
-- Returns true on success, or nil + error string on failure.
function M.save_session(session_name, workspace_name)
  workspace_name = workspace_name or session_name
  ensure_session_dir()

  local windows = {}
  for _, mux_win in ipairs(wezterm.mux.all_windows()) do
    if mux_win:get_workspace() == workspace_name then
      table.insert(windows, capture_window(mux_win))
    end
  end

  if #windows == 0 then
    return nil, "No windows found for workspace: " .. workspace_name
  end

  local data = {
    name      = session_name,
    saved_at  = os.date("!%Y-%m-%dT%H:%M:%S"),
    workspace = workspace_name,
    windows   = windows,
  }

  local path = M.SESSION_DIR .. "/" .. session_name .. ".json"
  local ok, json = pcall(wezterm.json_encode, data)
  if not ok then
    return nil, "JSON encode failed: " .. tostring(json)
  end

  local f, err = io.open(path, "w")
  if not f then
    return nil, "Cannot open file for writing: " .. tostring(err)
  end
  f:write(json)
  f:close()

  return true
end

-- ─── Public: Load ────────────────────────────────────────────────────────────

-- Reads and decodes ~/wezterm-session/<name>.json
-- Returns data table on success, or nil + error string on failure.
function M.load_session(name)
  local path = M.SESSION_DIR .. "/" .. name .. ".json"
  local f, err = io.open(path, "r")
  if not f then
    return nil, "Cannot open session file: " .. tostring(err)
  end
  local content = f:read("*a")
  f:close()

  local ok, data = pcall(wezterm.json_parse, content)
  if not ok then
    return nil, "JSON decode failed: " .. tostring(data)
  end
  return data
end

-- ─── Public: List ────────────────────────────────────────────────────────────

-- Returns sorted list of session name strings found in SESSION_DIR.
function M.list_sessions()
  ensure_session_dir()
  local names = {}
  local ok, entries = pcall(wezterm.read_dir, M.SESSION_DIR)
  if not ok then return names end
  for _, path in ipairs(entries) do
    local name = path:match("([^/]+)%.json$")
    if name then
      table.insert(names, name)
    end
  end
  table.sort(names)
  return names
end

-- ─── Public: Delete ──────────────────────────────────────────────────────────

-- Deletes ~/wezterm-session/<name>.json
-- Returns true on success, or nil + error string on failure.
function M.delete_session(name)
  local path = M.SESSION_DIR .. "/" .. name .. ".json"
  local ok, err = os.remove(path)
  if not ok then
    return nil, "Cannot delete session: " .. tostring(err)
  end
  return true
end

-- ─── Public: Restore ─────────────────────────────────────────────────────────

-- Restores a saved session by spawning tabs/panes.
-- target_win: MuxWindow to restore into (from window:mux_window() in a keybind).
--             When nil (e.g. gui-startup), a new window is spawned per saved window.
-- Returns true on success, or nil + error string on failure.
function M.restore_session(name, target_win)
  local data, err = M.load_session(name)
  if not data then
    return nil, err
  end

  for _, win_data in ipairs(data.windows) do
    -- mux_win starts as target_win each iteration.
    -- If nil, spawn_window will set it on the first tab.
    local mux_win = target_win

    for _, tab_data in ipairs(win_data.tabs) do
      if #tab_data.panes == 0 then goto continue end

      local tab_cwd = (tab_data.panes[1] and tab_data.panes[1].cwd) or wezterm.home_dir
      local mux_tab, pane_base

      if mux_win then
        mux_tab, pane_base = mux_win:spawn_tab({ cwd = tab_cwd })
      else
        -- Auto-restore: create a new window; mux_win is set for subsequent tabs
        mux_tab, pane_base, mux_win = wezterm.mux.spawn_window({
          workspace = data.workspace,
          cwd       = tab_cwd,
        })
      end

      if tab_data.title and #tab_data.title > 0 then
        mux_tab:set_title(tab_data.title)
      end

      -- Sort panes: top row first, then left to right
      local sorted = {}
      for _, p in ipairs(tab_data.panes) do
        table.insert(sorted, p)
      end
      table.sort(sorted, function(a, b)
        if a.top ~= b.top then return a.top < b.top end
        return a.left < b.left
      end)

      local spawned = { pane_base }

      for i = 2, #sorted do
        local prev_info = sorted[i - 1]
        local curr_info = sorted[i]
        local prev_pane = spawned[i - 1]

        local direction = infer_split_direction(prev_info, curr_info)
        local size      = infer_split_size(prev_info, curr_info, direction)

        local new_pane = prev_pane:split({
          direction = direction,
          cwd       = curr_info.cwd,
          size      = size,
        })
        table.insert(spawned, new_pane)
      end

      ::continue::
    end
  end

  return true
end

-- ─── Public: Auto-save timer ─────────────────────────────────────────────────

-- Schedules recurring auto-save for all active workspaces.
-- interval_seconds defaults to 300 (5 minutes). Call once at startup.
function M.start_autosave(interval_seconds)
  interval_seconds = interval_seconds or 300

  local function tick()
    for _, ws_name in ipairs(wezterm.mux.get_workspace_names()) do
      M.save_session(ws_name)
    end
    wezterm.time.call_after(interval_seconds, tick)
  end

  wezterm.time.call_after(interval_seconds, tick)
end

return M
