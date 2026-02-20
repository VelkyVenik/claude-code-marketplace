# Phase 3: Terminal Emulator

Install and configure the terminal emulator.

## macOS — Ghostty

### 3.1 Install Ghostty

```bash
brew install --cask ghostty
```

### 3.2 Deploy Configuration

Create the config directory and deploy the config file:

```bash
mkdir -p ~/.config/ghostty
```

Copy `configs/ghostty/config` from this plugin to `~/.config/ghostty/config`.

Before copying, check if a config already exists:
```bash
if [ -f ~/.config/ghostty/config ]; then
    echo "Existing Ghostty config found."
    # Ask user: overwrite, merge, or skip
fi
```

### 3.3 SSH Terminfo (Optional)

If the user has remote servers, offer to install Ghostty terminfo:

> Ghostty uses the `xterm-ghostty` terminfo entry. Remote servers may not have it, causing display issues.
> **Would you like to install Ghostty terminfo on remote servers?**

If yes, for each server:
```bash
infocmp -x xterm-ghostty | ssh user@server -- tic -x -
```

---

## Ubuntu

Ubuntu users typically use their default terminal emulator (GNOME Terminal, Konsole, etc.).

Ask the user:
> Ubuntu detected. Would you like to:
> 1. Keep your current terminal emulator (recommended)
> 2. Install Ghostty from source

If they want Ghostty on Ubuntu, note that it requires building from source and link to the Ghostty docs.

## Verification

```bash
# macOS
ghostty --version 2>/dev/null || echo "Ghostty not installed"

# Check config exists
ls -la ~/.config/ghostty/config 2>/dev/null || echo "No Ghostty config"
```
