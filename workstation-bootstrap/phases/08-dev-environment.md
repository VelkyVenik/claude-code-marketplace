# Phase 8: Dev Environment

Install core development runtimes. This phase is intentionally minimal — project-specific tooling belongs in project CLAUDE.md files, not in the global setup.

## Both OS

### 8.1 Node.js

Ask the user their preference:
> How would you like to manage Node.js versions?
> 1. **fnm** (Fast Node Manager — recommended, written in Rust)
> 2. **nvm** (Node Version Manager — traditional choice)

**fnm:**
```bash
# macOS
brew install fnm

# Ubuntu
curl -fsSL https://fnm.vercel.app/install | bash
```

Then install latest LTS:
```bash
fish -c "fnm install --lts && fnm default lts-latest"
```

Add fnm to Fish config if not already present:
```bash
fish -c 'fnm env --shell fish | source'
```

**nvm:**
```bash
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash
```

Then install latest LTS:
```bash
nvm install --lts
nvm alias default node
```

### 8.2 Bun

```bash
curl -fsSL https://bun.sh/install | bash
```

### 8.3 pnpm

```bash
# Using corepack (comes with Node.js)
corepack enable
corepack prepare pnpm@latest --activate
```

Or standalone:
```bash
curl -fsSL https://get.pnpm.io/install.sh | sh -
```

### 8.4 Python 3

**macOS:**
Python 3 is typically pre-installed. Verify:
```bash
python3 --version
```

If not present:
```bash
brew install python
```

**Ubuntu:**
```bash
sudo apt install -y python3 python3-pip python3-venv
```

### 8.5 uv (Python package manager)

```bash
curl -LsSf https://astral.sh/uv/install.sh | sh
```

Verify:
```bash
uv --version
```

### 8.6 Docker (Ubuntu only)

On Ubuntu, install Docker Engine:

```bash
# Remove old versions
sudo apt remove -y docker docker-engine docker.io containerd runc 2>/dev/null || true

# Install prerequisites
sudo apt install -y ca-certificates curl gnupg

# Add Docker GPG key
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg

# Add Docker repo
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Install Docker
sudo apt update
sudo apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# Add user to docker group
sudo usermod -aG docker $USER
```

On macOS, suggest Docker Desktop:
> Docker Desktop is recommended for macOS. Install it from https://docker.com/products/docker-desktop
> Or install via Homebrew: `brew install --cask docker`

## Verification

```bash
node --version
npm --version
bun --version
pnpm --version
python3 --version
uv --version
docker --version 2>/dev/null || echo "Docker not installed"
```
