# Phase 5: Modern CLI Tools

Install modern replacements for traditional Unix tools.

## Core Tools

These are used daily and referenced in shell abbreviations.

| Tool | Replaces | Purpose |
|------|----------|---------|
| bat | cat | Syntax-highlighted file viewer |
| eza | ls | Modern file listing with icons and git status |
| ripgrep (rg) | grep | Fast recursive search |
| fzf | — | Fuzzy finder |
| zoxide | cd | Smart directory jumper |
| jq | — | JSON processor |
| btop | top/htop | System resource monitor |
| dust | du | Disk usage analyzer |

### macOS (Homebrew)

```bash
brew install bat eza ripgrep fzf zoxide jq btop dust
```

### Ubuntu (apt)

```bash
sudo apt install -y bat ripgrep fzf jq btop eza zoxide du-dust
```

## Optional Tools

Nice to have but not essential for the base setup.

| Tool | Replaces | Purpose |
|------|----------|---------|
| fd | find | Simple, fast file finder |
| tldr | man | Simplified man pages |
| duf | df | Disk usage/free utility |
| httpie | curl | User-friendly HTTP client |

### macOS (Homebrew)

```bash
brew install fd tldr duf httpie
```

### Ubuntu (apt)

```bash
sudo apt install -y fd-find duf httpie tldr
```

If any package is not available in your Ubuntu version, install via pip or npm as fallback:
```bash
# tldr fallback
pip3 install tldr || npm install -g tldr
```

## Ubuntu symlinks

These are created in Phase 4, but verify they exist:
```bash
# bat is installed as batcat on Ubuntu
ls -la ~/.local/bin/bat

# fd is installed as fdfind on Ubuntu
ls -la ~/.local/bin/fd
```

## Verification

Check core tools are accessible:
```bash
bat --version
eza --version
rg --version
fzf --version
zoxide --version
jq --version
btop --version
dust --version
```

Check optional tools (if installed):
```bash
fd --version
tldr --version
duf --version
http --version
```

Report any tools that failed to install.
