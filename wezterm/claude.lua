local M = {}
local wezterm = require("wezterm")
local act = wezterm.action

local _cache = { total = 0, counts = { running = 0, waiting_approval = 0, idle = 0 }, updated_at = 0 }
local CACHE_TTL = 3

-- Claude Code hooks (.claude/wezterm-state.sh) が書き出す状態ファイル。
-- $WEZTERM_PANE をキーにしているので pane_id と直接対応する。
local STATE_DIR = os.getenv("HOME") .. "/.claude/wezterm-state"
local STATE_STALE_SEC = 1800

local function is_claude_pane(pane)
  local proc = pane:get_foreground_process_name()
  if not proc then return false end
  -- フルパスに "claude" が含まれれば一致
  -- 例: ~/.local/share/claude/versions/2.1.89
  if proc:find("claude") then return true end

  return false
end

-- ps -eo pid,ppid,comm で全プロセスの親子マップを一括構築
local function build_children_map()
  local children = {}
  local handle = io.popen("ps -eo pid,ppid,comm 2>/dev/null")
  if not handle then return children end
  for line in handle:lines() do
    local p, pp, name = line:match("^%s*(%d+)%s+(%d+)%s+(%S+)")
    if p and pp and name then
      local ppid = tonumber(pp)
      if not children[ppid] then children[ppid] = {} end
      table.insert(children[ppid], name)
    end
  end
  handle:close()
  return children
end

-- 子プロセスに caffeinate があれば running、なければ idle
-- Claude Code はタスク実行中に caffeinate をspawn し、入力待ちで終了させる
-- (hooksの状態ファイルが無い/staleな場合のフォールバック用)
local function detect_state(pid, children_map)
  for _, name in ipairs(children_map[pid] or {}) do
    if name == "caffeinate" then return "running" end
  end
  return "idle"
end

-- ~/.claude/wezterm-state/<pane_id>.json を読む。
-- 無い/壊れている/staleな場合は nil を返す。
local function read_state_file(pane_id)
  local f = io.open(STATE_DIR .. "/" .. tostring(pane_id) .. ".json", "r")
  if not f then return nil end
  local content = f:read("*a")
  f:close()
  if not content or #content == 0 then return nil end

  local ok, data = pcall(wezterm.json_parse, content)
  if not ok or type(data) ~= "table" then return nil end
  if not data.updated_at or (os.time() - data.updated_at) > STATE_STALE_SEC then
    return nil
  end
  return data
end

-- hooksが書いた状態ファイルを優先し、無ければ caffeinate ベースの判定にフォールバックする。
local function resolve_state(pid, pane_id, children_map)
  local file_state = read_state_file(pane_id)
  if file_state and file_state.state then
    return file_state.state
  end
  return pid and detect_state(pid, children_map) or "idle"
end

function M.collect_sessions()
  local children_map = build_children_map()
  local sessions = {}
  for _, mux_win in ipairs(wezterm.mux.all_windows()) do
    local workspace = mux_win:get_workspace()
    local window_id = mux_win:window_id()
    for tab_idx, tab in ipairs(mux_win:tabs()) do
      for _, info in ipairs(tab:panes_with_info()) do
        local p = info.pane
        if is_claude_pane(p) then
          local proc_info = p:get_foreground_process_info()
          local pid = proc_info and proc_info.pid
          table.insert(sessions, {
            workspace  = workspace,
            window_id  = window_id,
            tab_index  = tab_idx,
            tab_title  = tab:get_title(),
            pane_id    = p:pane_id(),
            pane_index = info.index,
            state      = resolve_state(pid, p:pane_id(), children_map),
            tab        = tab,
            pane       = p,
          })
        end
      end
    end
  end
  return sessions
end

-- 戻り値: { total = N, counts = { running = N, waiting_approval = N, idle = N }, updated_at = N }
function M.get_summary()
  local now = os.time()
  if now - _cache.updated_at >= CACHE_TTL then
    local sessions = M.collect_sessions()
    local counts = { running = 0, waiting_approval = 0, idle = 0 }
    for _, s in ipairs(sessions) do
      counts[s.state] = (counts[s.state] or 0) + 1
    end
    _cache = { total = #sessions, counts = counts, updated_at = now }
  end
  return _cache
end

-- target: M.collect_sessions() が返すレコードの1つ。
-- 対象paneのworkspace/windowにフォーカスを移し、paneをactivateする。
function M.focus_session(window, pane, target)
  if window:active_workspace() ~= target.workspace then
    window:perform_action(act.SwitchToWorkspace({ name = target.workspace }), pane)
  end
  -- workspace切替がGUI側に反映されるまで一拍待ってからwindow/paneを解決する
  wezterm.time.call_after(0.05, function()
    local gui_win = wezterm.gui.gui_window_for_mux_window(target.window_id)
    if gui_win then
      gui_win:focus()
    end
    target.pane:activate()
  end)
end

return M
