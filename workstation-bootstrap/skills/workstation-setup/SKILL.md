# Workstation Setup Skill

This skill auto-activates when the user asks about setting up, bootstrapping, or provisioning a workstation.

## Triggers

Activate when the user mentions any of:
- "setup", "bootstrap", "workstation", "provision"
- "new machine", "fresh install", "dev environment"
- "set up my machine", "configure my laptop"
- "install developer tools", "dev setup"

## Response

When triggered, inform the user about the workstation bootstrap plugin and suggest running the setup command:

> I can help you set up your workstation! The **workstation-bootstrap** plugin provides a phased, interactive setup process that covers:
>
> 1. Security hardening (FileVault/UFW, firewall, auto-updates)
> 2. Package managers (Homebrew / apt)
> 3. Terminal emulator (Ghostty on macOS)
> 4. Shell (Fish + Fisher plugins + Tide prompt)
> 5. Modern CLI tools (bat, eza, ripgrep, fd, fzf, zoxide, etc.)
> 6. Editor (Vim with plugins)
> 7. Git & GitHub CLI
> 8. Dev environment (Node.js, Python, Docker)
> 9. Claude Code & plugins
> 10. Tmux (terminal multiplexer)
> 11. SSH authorized keys
> 12. Claude Code status line
>
> Run `/setup` to start the interactive bootstrap process.

## Phase Reference

Detailed phase instructions are in the `phases/` directory of this plugin. Each phase supports both macOS and Ubuntu and runs idempotently.
