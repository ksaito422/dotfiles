#!/bin/bash

# Read JSON input from stdin
input=$(cat)

# Extract information from JSON
model_name=$(echo "$input" | jq -r '.model.display_name')
current_dir=$(echo "$input" | jq -r '.workspace.current_dir')

# Get current user and git info
short_dir=$(basename "$current_dir")

# Get git branch if in a git repo
git_branch=""
if git rev-parse --git-dir > /dev/null 2>&1; then
    branch=$(git branch --show-current 2>/dev/null)
    if [ -n "$branch" ]; then
        git_branch="🌿 ${branch}"
    fi
fi

# Extract context usage and cost
ctx_pct=$(echo "$input" | jq -r '.context_window.used_percentage // 0' | awk '{printf "%d", $1}')
cost_usd=$(echo "$input" | jq -r '.cost.total_cost_usd // 0')
cost_display=$(printf "%.4f" "$cost_usd" 2>/dev/null || echo "0.0000")

# Color codes using $'...' so escape sequences are interpreted in variables
model_color=$'\033[38;2;255;255;255m\033[48;2;102;51;204m'  # purple background
green=$'\033[32m'
yellow=$'\033[33m'
red=$'\033[31m'
reset=$'\033[0m'

# Build progress bar (10 chars)
filled=$((ctx_pct * 10 / 100))
empty=$((10 - filled))
BAR=""
[ "$filled" -gt 0 ] && printf -v FILL "%${filled}s" && BAR="${FILL// /▓}"
[ "$empty" -gt 0 ] && printf -v PAD "%${empty}s" && BAR="${BAR}${PAD// /░}"

# Pick bar color based on usage
if [ "$ctx_pct" -ge 90 ]; then bar_color="$red"
elif [ "$ctx_pct" -ge 70 ]; then bar_color="$yellow"
else bar_color="$green"; fi

echo "${model_color} ${model_name} ${reset} 🗂️${short_dir} ${git_branch}"

echo "Ctx: ${bar_color}${BAR}${reset} ${ctx_pct}% 💰 \$${cost_display} ${reset}"
