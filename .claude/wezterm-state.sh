#!/bin/bash
# WezTerm用: Claude Codeセッションの状態(running/waiting_approval/idle)を
# ペイン単位(~/.claude/wezterm-state/<pane_id>.json)に書き出す。
# wezterm/claude.lua がこのファイルを読み、ステータスバーやセッション一覧に反映する。
#
# 使い方: wezterm-state.sh <event>
#   event: SessionStart / UserPromptSubmit / Notification / Stop / SessionEnd

event="$1"

pane_id="${WEZTERM_PANE:-}"
# WezTerm以外のターミナルでは何もしない
[ -z "$pane_id" ] && exit 0

state_dir="$HOME/.claude/wezterm-state"
mkdir -p "$state_dir"
state_file="$state_dir/${pane_id}.json"

input="$(cat)"

if [ "$event" = "SessionEnd" ]; then
  rm -f "$state_file"
  exit 0
fi

session_id=$(printf '%s' "$input" | jq -r '.session_id // empty' 2>/dev/null)
cwd=$(printf '%s' "$input" | jq -r '.cwd // empty' 2>/dev/null)
now=$(date +%s)

case "$event" in
  SessionStart)     state="idle" ;;
  UserPromptSubmit) state="running" ;;
  Stop)             state="idle" ;;
  Notification)
    # 実ペイロードで確認済み: stdin JSONに notification_type フィールドが含まれる
    # (例: permission_prompt)。matcherでの振り分けは二重発火のリスクがあるため、
    # ここでフィールド値を見て判定する。
    notification_type=$(printf '%s' "$input" | jq -r '.notification_type // empty' 2>/dev/null)
    case "$notification_type" in
      permission_prompt|elicitation_dialog|elicitation_url_dialog) state="waiting_approval" ;;
      *) state="idle" ;;
    esac
    ;;
  *) state="idle" ;;
esac

tmp_file="$(mktemp "${state_file}.XXXXXX" 2>/dev/null)"
[ -z "$tmp_file" ] && exit 0

jq -n \
  --arg state "$state" \
  --arg session_id "$session_id" \
  --arg cwd "$cwd" \
  --arg pane_id "$pane_id" \
  --arg event "$event" \
  --argjson updated_at "$now" \
  --argjson raw "${input:-null}" \
  '{state: $state, session_id: $session_id, cwd: $cwd, pane_id: $pane_id,
    last_event: $event, updated_at: $updated_at, raw: $raw}' \
  > "$tmp_file" 2>/dev/null && mv "$tmp_file" "$state_file" || rm -f "$tmp_file"
