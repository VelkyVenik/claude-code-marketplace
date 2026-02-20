# Phase 12: Claude Code Status Line

Set up a custom Claude Code status line showing model, project, git branch, and context usage.

## Both OS

### 12.1 Deploy Status Line Script

Copy `configs/claude/statusline-command.sh` from this plugin to `~/.claude/statusline-command.sh`:

```bash
mkdir -p ~/.claude
cp configs/claude/statusline-command.sh ~/.claude/statusline-command.sh
chmod +x ~/.claude/statusline-command.sh
```

### 12.2 Configure Claude Code Settings

Read the existing `~/.claude/settings.json` (if it exists) and add/update the `statusLine` configuration:

```json
{
  "statusLine": {
    "type": "command",
    "command": "bash ~/.claude/statusline-command.sh"
  }
}
```

**Important:** Merge this into existing settings — do not overwrite other configuration.

### 12.3 Status Line Output Format

The status line displays:
```
🤖 Model Name | 📁 project-name | 🌿 branch | 📊 42%
```

- **🤖 Model**: The active Claude model name
- **📁 Project**: Current directory/project name
- **🌿 Branch**: Git branch (only shown inside git repos)
- **📊 Context**: Context window usage percentage (when available)

### 12.4 Dependencies

The status line script requires `jq` to parse JSON input. This is installed in Phase 5 (CLI Tools).

## Verification

```bash
ls -la ~/.claude/statusline-command.sh
cat ~/.claude/settings.json | jq '.statusLine'
```
