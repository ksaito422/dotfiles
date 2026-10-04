#!/bin/bash
# Claude Code用: macOSデスクトップ通知 + サウンドを鳴らす。
# 使い方: notify.sh <event>   (event: Notification / Stop)
# stdinのhook JSONから通知メッセージとcwdを取り出して表示する。

event="$1"
input="$(cat)"

project=$(printf '%s' "$input" | jq -r '.cwd // empty' 2>/dev/null)
project="${project##*/}"

case "$event" in
  Stop)
    title="Claude Code ✅ 完了"
    message="タスクが完了しました"
    sound="Glass"
    ;;
  *)
    title="Claude Code ⚠️ 確認待ち"
    message=$(printf '%s' "$input" | jq -r '.message // empty' 2>/dev/null)
    message="${message:-承認が必要です}"
    sound="Sosumi"
    ;;
esac

[ -n "$project" ] && title="$title [$project]"

# AppleScript文字列用にエスケープ
esc() { printf '%s' "$1" | sed 's/\\/\\\\/g; s/"/\\"/g'; }

osascript -e "display notification \"$(esc "$message")\" with title \"$(esc "$title")\" sound name \"$sound\"" >/dev/null 2>&1

exit 0
