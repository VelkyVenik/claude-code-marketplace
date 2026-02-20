# Phase 9: Claude Code & Plugins

Configure Claude Code plugins and integrations. Claude Code itself is already installed (since you're running this plugin through it).

## Both OS

### 9.1 Verify Claude Code

```bash
claude --version
```

If this fails, something is wrong — Claude Code must be installed to run this plugin.

### 9.2 Install CodeRabbit

```bash
curl -fsSL https://cli.coderabbit.ai/install.sh | sh
```

Then authenticate:
```bash
coderabbit auth
```

Then add as a Claude Code plugin:
```bash
claude plugin add coderabbit
```

### 9.3 Add Venik Marketplace

```bash
claude plugin marketplace add VelkyVenik/claude-code-marketplace
```

### 9.4 Verify Claude Code Abbreviations

These should already be in the Fish config, but verify:

```bash
fish -c "abbr --show" | grep -E "cc|ccr"
```

If not present, add them:
```bash
fish -c 'abbr -a cc claude'
fish -c 'abbr -a ccr "claude --resume"'
```

## Verification

```bash
claude --version
coderabbit --version 2>/dev/null || echo "CodeRabbit not installed"
```
