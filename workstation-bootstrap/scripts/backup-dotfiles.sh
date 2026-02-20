#!/usr/bin/env bash
# Back up existing dotfiles before overwriting
# Creates a timestamped backup directory in ~/

set -euo pipefail

BACKUP_DIR="$HOME/dotfiles-backup-$(date '+%Y%m%d-%H%M%S')"
BACKED_UP=false

backup_if_exists() {
    local src="$1"
    local name="$2"

    if [ -f "$src" ] || [ -d "$src" ]; then
        if [ "$BACKED_UP" = false ]; then
            mkdir -p "$BACKUP_DIR"
            BACKED_UP=true
            echo "Backup directory: $BACKUP_DIR"
        fi
        cp -r "$src" "$BACKUP_DIR/$name"
        echo "  Backed up: $src -> $BACKUP_DIR/$name"
    fi
}

echo "Checking for existing dotfiles to back up..."

# Fish config
backup_if_exists "$HOME/.config/fish/config.fish" "config.fish"

# Vim config
backup_if_exists "$HOME/.vimrc" "vimrc"

# Git config
backup_if_exists "$HOME/.gitconfig" "gitconfig"

# Ghostty config
backup_if_exists "$HOME/.config/ghostty/config" "ghostty-config"

# Tmux config
backup_if_exists "$HOME/.tmux.conf" "tmux.conf"

# Claude status line
backup_if_exists "$HOME/.claude/statusline-command.sh" "statusline-command.sh"

if [ "$BACKED_UP" = true ]; then
    echo ""
    echo "Dotfiles backed up to: $BACKUP_DIR"
else
    echo "No existing dotfiles found to back up."
fi
