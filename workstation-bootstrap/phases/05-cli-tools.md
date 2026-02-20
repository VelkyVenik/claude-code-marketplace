# Phase 5: Modern CLI Tools

Install modern replacements for traditional Unix tools.

## Tool List

| Tool | Replaces | Purpose |
|------|----------|---------|
| bat | cat | Syntax-highlighted file viewer |
| eza | ls | Modern file listing with icons and git status |
| ripgrep (rg) | grep | Fast recursive search |
| fd | find | Simple, fast file finder |
| fzf | — | Fuzzy finder |
| zoxide | cd | Smart directory jumper |
| tldr | man | Simplified man pages |
| jq | — | JSON processor |
| btop | top/htop | System resource monitor |
| dust | du | Disk usage analyzer |
| duf | df | Disk usage/free utility |
| httpie | curl | User-friendly HTTP client |

## macOS (Homebrew)

```bash
brew install bat eza ripgrep fd fzf zoxide tldr jq btop dust duf httpie
```

Each tool should be checked before installing:
```bash
command -v <tool> >/dev/null 2>&1 && echo "<tool> already installed" || brew install <package>
```

## Ubuntu (apt)

```bash
sudo apt install -y bat ripgrep fzf jq btop duf fd-find eza zoxide du-dust httpie tldr
```

If any package is not available in your Ubuntu version, install via pip or npm as fallback:
```bash
# tldr fallback
pip3 install tldr || npm install -g tldr
```

### Ubuntu symlinks

These are created in Phase 4, but verify they exist:
```bash
# bat is installed as batcat on Ubuntu
ls -la ~/.local/bin/bat

# fd is installed as fdfind on Ubuntu
ls -la ~/.local/bin/fd
```

## Verification

Check each tool is accessible:
```bash
bat --version
eza --version
rg --version
fd --version
fzf --version
zoxide --version
tldr --version
jq --version
btop --version
dust --version
duf --version
http --version
```

Report any tools that failed to install.
