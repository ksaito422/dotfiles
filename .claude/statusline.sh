#!/bin/bash

# Read JSON input from stdin
input=$(cat)

# Extract information from JSON
model_name=$(echo "$input" | jq -r '.model.display_name')
current_dir=$(echo "$input" | jq -r '.workspace.current_dir')
session_id=$(echo "$input" | jq -r '.session_id')

# Get current user and git info
short_dir=$(basename "$current_dir")

# Get git branch if in a git repo
git_branch=""
if git rev-parse --git-dir > /dev/null 2>&1; then
    branch=$(git branch --show-current 2>/dev/null)
    if [ -n "$branch" ]; then
        git_branch=" (${branch})"
    fi
fi

# Color codes (similar to zsh config but adapted for printf)
path_color="\033[38;2;255;255;255m\033[48;2;0;102;153m"  # path color
model_color="\033[38;2;255;255;255m\033[48;2;102;51;204m"  # model color (purple background)
reset="\033[0m"

printf "${path_color} %s ${reset}${model_color} %s ${reset}%s" \
    "$short_dir" "$model_name" "$git_branch"

