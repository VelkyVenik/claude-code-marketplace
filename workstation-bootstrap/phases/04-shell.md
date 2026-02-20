# Phase 4: Shell Setup

Install Fish shell with Fisher plugin manager, plugins, and configuration.

## Both OS

### 4.1 Install Fish Shell

**macOS:**
```bash
brew install fish
```

**Ubuntu:**
```bash
sudo apt install -y fish
```

### 4.2 Set Fish as Default Shell

Add Fish to allowed shells and set as default:

```bash
# Get Fish path
FISH_PATH=$(command -v fish)

# Add to /etc/shells if not already there
grep -q "$FISH_PATH" /etc/shells || echo "$FISH_PATH" | sudo tee -a /etc/shells

# Set as default shell
chsh -s "$FISH_PATH"
```

### 4.3 Install Fisher

```bash
fish -c "curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher"
```

### 4.4 Install Fish Plugins

```bash
fish -c "fisher install IlanCosman/tide@v6"
fish -c "fisher install PatrickF1/fzf.fish"
fish -c "fisher install jorgebucaran/autopair.fish"
fish -c "fisher install gazorby/fish-abbreviation-tips"
```

### 4.5 Deploy Fish Configuration

Create the config directory and deploy the config file:

```bash
mkdir -p ~/.config/fish
```

Copy `configs/fish/config.fish` from this plugin to `~/.config/fish/config.fish`.

Before copying, check if a config already exists and ask the user before overwriting.

### 4.6 Configure Tide Prompt

Apply Tide configuration (Lean style, one line, transient prompt, no frame):

```bash
# Prompt layout
fish -c "set -U tide_left_prompt_items pwd git character"
fish -c "set -U tide_right_prompt_items status cmd_duration context jobs direnv bun node python rustc go java php ruby zig"

# Lean style — no background colors, space separators
fish -c "set -U tide_left_prompt_frame_enabled false"
fish -c "set -U tide_right_prompt_frame_enabled false"
fish -c "set -U tide_left_prompt_prefix ''"
fish -c "set -U tide_left_prompt_suffix ''"
fish -c "set -U tide_right_prompt_prefix ' '"
fish -c "set -U tide_right_prompt_suffix ''"
fish -c "set -U tide_left_prompt_separator_diff_color ' '"
fish -c "set -U tide_left_prompt_separator_same_color ' '"
fish -c "set -U tide_right_prompt_separator_diff_color ' '"
fish -c "set -U tide_right_prompt_separator_same_color ' '"
fish -c "set -U tide_prompt_icon_connection ' '"
fish -c "set -U tide_prompt_color_frame_and_connection brblack"
fish -c "set -U tide_prompt_color_separator_same_color brblack"

# One line, no newline before prompt
fish -c "set -U tide_prompt_add_newline_before false"
fish -c "set -U tide_prompt_min_cols 34"
fish -c "set -U tide_prompt_pad_items false"

# Transient prompt
fish -c "set -U tide_prompt_transient_enabled true"

# Character (prompt symbol)
fish -c "set -U tide_character_icon ❯"
fish -c "set -U tide_character_color brgreen"
fish -c "set -U tide_character_color_failure brred"
fish -c "set -U tide_character_vi_icon_default ❮"
fish -c "set -U tide_character_vi_icon_replace ▶"
fish -c "set -U tide_character_vi_icon_visual V"

# PWD colors
fish -c "set -U tide_pwd_bg_color normal"
fish -c "set -U tide_pwd_color_anchors brcyan"
fish -c "set -U tide_pwd_color_dirs cyan"
fish -c "set -U tide_pwd_color_truncated_dirs magenta"
fish -c "set -U tide_pwd_icon ''"
fish -c "set -U tide_pwd_icon_home ''"
fish -c "set -U tide_pwd_icon_unwritable "

# Git colors
fish -c "set -U tide_git_bg_color normal"
fish -c "set -U tide_git_bg_color_unstable normal"
fish -c "set -U tide_git_bg_color_urgent normal"
fish -c "set -U tide_git_color_branch brgreen"
fish -c "set -U tide_git_color_conflicted brred"
fish -c "set -U tide_git_color_dirty bryellow"
fish -c "set -U tide_git_color_operation brred"
fish -c "set -U tide_git_color_staged bryellow"
fish -c "set -U tide_git_color_stash brgreen"
fish -c "set -U tide_git_color_untracked brblue"
fish -c "set -U tide_git_color_upstream brgreen"
fish -c "set -U tide_git_icon ''"
fish -c "set -U tide_git_truncation_length 24"

# Status icons
fish -c "set -U tide_status_bg_color normal"
fish -c "set -U tide_status_bg_color_failure normal"
fish -c "set -U tide_status_color green"
fish -c "set -U tide_status_color_failure red"
fish -c "set -U tide_status_icon ✔"
fish -c "set -U tide_status_icon_failure ✘"

# Cmd duration
fish -c "set -U tide_cmd_duration_bg_color normal"
fish -c "set -U tide_cmd_duration_color brblack"
fish -c "set -U tide_cmd_duration_decimals 0"
fish -c "set -U tide_cmd_duration_icon ''"
fish -c "set -U tide_cmd_duration_threshold 3000"

# Context
fish -c "set -U tide_context_always_display false"
fish -c "set -U tide_context_bg_color normal"
fish -c "set -U tide_context_color_default yellow"
fish -c "set -U tide_context_color_root bryellow"
fish -c "set -U tide_context_color_ssh yellow"
fish -c "set -U tide_context_hostname_parts 1"

# Jobs
fish -c "set -U tide_jobs_bg_color normal"
fish -c "set -U tide_jobs_color green"
fish -c "set -U tide_jobs_icon "
fish -c "set -U tide_jobs_number_threshold 1000"

# Language/runtime item colors (all lean/normal bg)
fish -c "set -U tide_node_bg_color normal"
fish -c "set -U tide_node_color green"
fish -c "set -U tide_node_icon "
fish -c "set -U tide_python_bg_color normal"
fish -c "set -U tide_python_color cyan"
fish -c "set -U tide_python_icon 󰌠"
fish -c "set -U tide_bun_bg_color normal"
fish -c "set -U tide_bun_color white"
fish -c "set -U tide_bun_icon 󰳓"
fish -c "set -U tide_docker_bg_color normal"
fish -c "set -U tide_docker_color blue"
fish -c "set -U tide_docker_icon "
```

### 4.7 Ubuntu-Specific Setup

On Ubuntu only:

```bash
# Create local bin directory
mkdir -p ~/.local/bin

# Symlink batcat to bat (Ubuntu installs bat as batcat)
ln -sf /usr/bin/batcat ~/.local/bin/bat 2>/dev/null || true

# Symlink fdfind to fd (Ubuntu installs fd as fdfind)
ln -sf /usr/bin/fdfind ~/.local/bin/fd 2>/dev/null || true
```

### 4.8 macOS-Specific Setup

On macOS, the Fish config includes PATH additions for:
- `/opt/homebrew/sbin`
- `$HOME/.local/bin`

These are handled by the deployed `config.fish`.

## Verification

```bash
# Check Fish is default shell
echo $SHELL

# Check Fisher is installed
fish -c "fisher --version"

# Check plugins
fish -c "fisher list"
```
