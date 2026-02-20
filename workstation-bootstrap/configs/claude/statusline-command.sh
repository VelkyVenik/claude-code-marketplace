#!/bin/bash
# Claude Code status line command
# Deployed by workstation-bootstrap plugin
# Shows: model | project | git branch | context usage

# Read JSON input from stdin
input=$(cat)

# Extract basic info
model=$(echo "$input" | jq -r '.model.display_name // "Claude"')
cwd=$(echo "$input" | jq -r '.workspace.current_dir // .cwd')

# Get project/directory name
project_name=$(basename "$cwd")

# Git branch info
git_branch=""
if git -C "$cwd" rev-parse --git-dir > /dev/null 2>&1; then
    branch=$(git -C "$cwd" -c core.fileMode=false --no-optional-locks rev-parse --abbrev-ref HEAD 2>/dev/null)
    if [ -n "$branch" ]; then
        git_branch=" | 🌿 ${branch}"
    fi
fi

# Context window usage percentage
ctx_info=""
used_percentage=$(echo "$input" | jq -r '.context_window.used_percentage // empty')
if [ -n "$used_percentage" ]; then
    percent=$(printf "%.0f" "$used_percentage")
    ctx_info=" | 📊 ${percent}%"
fi

# Output the complete status line
echo "🤖 ${model} | 📁 ${project_name}${git_branch}${ctx_info}"
