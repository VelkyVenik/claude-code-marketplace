# Claude Code Marketplace

## Repository Structure

This is a Claude Code plugin marketplace repository. Each top-level directory is a standalone plugin with its own `.claude-plugin/plugin.json` manifest.

```
<plugin-name>/
├── .claude-plugin/plugin.json   # Plugin manifest (required)
├── agents/                      # Agent definitions
├── skills/                      # Auto-activating skills
├── commands/                    # Slash commands
├── configs/                     # Config files to deploy
├── scripts/                     # Helper scripts
└── README.md                    # Plugin documentation
```

## Conventions

- Each plugin is self-contained in its own directory
- Plugin names use kebab-case
- Scripts in `scripts/` must be executable (`chmod +x`)
- Config files use templates with `__PLACEHOLDER__` syntax for user-specific values
- Never hardcode secrets, credentials, or personal SSH keys in plugin files
- Phase files in `phases/` are numbered sequentially (01-, 02-, etc.)

## Current Plugins

- **workstation-bootstrap** — Developer workstation provisioning (macOS + Ubuntu)
