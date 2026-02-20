# Phase 2: Package Managers

Set up the system package manager for installing all subsequent tools.

## macOS — Homebrew

### 2.1 Check if Homebrew is installed

```bash
command -v brew >/dev/null 2>&1 && echo "installed" || echo "not installed"
```

### 2.2 Install Homebrew (if not present)

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

After install, ensure brew is in PATH:
```bash
# For Apple Silicon Macs
eval "$(/opt/homebrew/bin/brew shellenv)"

# For Intel Macs
eval "$(/usr/local/bin/brew shellenv)"
```

### 2.3 Update and upgrade

```bash
brew update && brew upgrade
```

### 2.4 Disable environment hints

```bash
export HOMEBREW_NO_ENV_HINTS=1
```

This will also be set permanently in the Fish config (Phase 4).

---

## Ubuntu — apt

### 2.1 Update apt

```bash
sudo apt update && sudo apt upgrade -y
```

### 2.2 Install essential build tools

```bash
sudo apt install -y build-essential curl wget git software-properties-common
```

## Verification

```bash
# macOS
brew --version

# Ubuntu
apt --version
gcc --version
```
