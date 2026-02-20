# Phase 10: Tmux

Install tmux and deploy the configuration.

## Both OS

### 10.1 Install tmux

**macOS:**
```bash
brew install tmux
```

**Ubuntu:**
```bash
sudo apt install -y tmux
```

### 10.2 Deploy tmux Configuration

Copy `configs/tmux/tmux.conf` from this plugin to `~/.tmux.conf`.

Before copying, check if a tmux config already exists:
```bash
if [ -f ~/.tmux.conf ]; then
    echo "Existing tmux config found."
    # Ask user: overwrite, merge, or skip
fi
```

### 10.3 Key Features of This Config

- **Prefix remapped** to `Ctrl-A` (instead of default `Ctrl-B`)
- **Mouse support** enabled
- **Window numbering** starts at 1 (not 0)
- **Auto-renumber** windows on close
- **Reload config** with `prefix + r`
- **Custom status bar** with username, hostname, date, and time

## Verification

```bash
tmux -V
ls -la ~/.tmux.conf
```
