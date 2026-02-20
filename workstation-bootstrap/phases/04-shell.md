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

Run Tide's interactive configuration:

```bash
fish -c "tide configure"
```

This is interactive — the user will choose their preferred prompt style.

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
