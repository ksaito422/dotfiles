local M = {}
local wezterm = require("wezterm")

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
local function detect_state(pid, children_map)
  for _, name in ipairs(children_map[pid] or {}) do
    if name == "caffeinate" then return "running" end
  end
  return "idle"
end

function M.collect_sessions()
  local children_map = build_children_map()
  local sessions = {}
  for _, mux_win in ipairs(wezterm.mux.all_windows()) do
    local workspace = mux_win:get_workspace()
    for tab_idx, tab in ipairs(mux_win:tabs()) do
      for _, info in ipairs(tab:panes_with_info()) do
        local p = info.pane
        if is_claude_pane(p) then
          local proc_info = p:get_foreground_process_info()
          local pid = proc_info and proc_info.pid
          table.insert(sessions, {
            workspace  = workspace,
            tab_index  = tab_idx,
            tab_title  = tab:get_title(),
            pane_id    = p:pane_id(),
            pane_index = info.index,
            state      = pid and detect_state(pid, children_map) or "idle",
            tab        = tab,
            pane       = p,
          })
        end
      end
    end
  end
  return sessions
end

function M.build_palette_entries(_, _)
  local state_colors = {
    running = "🟢",
    idle    = "⚪",
  }

  local sessions = M.collect_sessions()

  if #sessions == 0 then
    return {
      {
        brief  = "Agent: No active sessions",
        icon   = "md_robot_off",
        action = wezterm.action_callback(function() end),
      },
    }
  end

  local entries = {}
  for _, s in ipairs(sessions) do
    local dot   = state_colors[s.state] or "⚫"
    local title = (#s.tab_title > 0) and s.tab_title or ("Tab " .. s.tab_index)
    local brief = string.format(
      "%s  Agent  %s: %s (Tab %d, Pane %d)",
      dot, s.workspace, title, s.tab_index, s.pane_index
    )
    local captured = s
    table.insert(entries, {
      brief  = brief,
      icon   = "md_robot",
      action = wezterm.action_callback(function(cb_win, cb_pane)
        if captured.workspace ~= cb_win:active_workspace() then
          cb_win:perform_action(
            wezterm.action.SwitchToWorkspace({ name = captured.workspace }),
            cb_pane
          )
        end
        local ok, err = pcall(function()
          captured.tab:activate()
          captured.pane:activate()
        end)
        if not ok then
          wezterm.log_warn("claude.lua: navigate failed: " .. tostring(err))
        end
      end),
    })
  end
  return entries
end

return M
