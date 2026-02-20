# Workstation Bootstrap

Complete developer workstation provisioning for **macOS** and **Ubuntu** — powered by Claude Code.

Security hardening, shell, editor, CLI tools, tmux, SSH keys, and Claude Code setup. All interactive, phased, and idempotent.

## Getting Started

### 1. Install Claude Code

```bash
curl -fsSL https://claude.ai/install.sh | bash
```

### 2. Add the Venik Marketplace

```bash
claude plugin marketplace add VelkyVenik/claude-code-marketplace
```

### 3. Run the Setup

```bash
claude
```

Then inside Claude Code:

```
/workstation-bootstrap:setup
```

### 4. Fun :)

Sit back and confirm each phase as Claude provisions your entire workstation.

## What Gets Installed

| Phase | What | Details |
|-------|------|---------|
| 1 | Security Hardening | FileVault/UFW, firewall, auto-updates |
| 2 | Package Managers | Homebrew / apt |
| 3 | Terminal | Ghostty (macOS) |
| 4 | Shell | Fish + Fisher + Tide + plugins |
| 5 | CLI Tools | bat, eza, ripgrep, fd, fzf, zoxide, jq, btop, dust, duf, httpie, tldr |
| 6 | Editor | Vim + vim-plug + plugins |
| 7 | Git | Git config + GitHub CLI + auth |
| 8 | Dev Environment | Node.js, Bun, pnpm, Python, Docker |
| 9 | Claude Code | CodeRabbit, marketplace |
| 10 | Tmux | Terminal multiplexer with custom config |
| 11 | SSH Keys | Authorized keys setup |
| 12 | Claude Status Line | Custom status line with model, project, branch, context |

## Features

- **OS detection** — automatically detects macOS vs Ubuntu
- **Phase confirmation** — asks before each phase (Y/n/skip)
- **Dotfile backup** — backs up existing configs before overwriting
- **Idempotent** — safe to re-run, skips already-installed tools
- **Resumable** — re-run and skip completed phases
- **Logging** — all actions logged to `~/workstation-setup.log`
