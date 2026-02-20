# Phase 7: Git Configuration

Configure Git and install GitHub CLI.

## Both OS

### 7.1 Deploy gitconfig

Copy `configs/git/gitconfig` from this plugin to `~/.gitconfig`.

Before deploying, ask the user for:
- **Name**: "What name should be used for Git commits?"
- **Email**: "What email should be used for Git commits?"

Replace the placeholders in the template with the user's values.

### 7.2 Set Credential Helper

**macOS:**
The gitconfig template already includes `credential.helper = osxkeychain`.

**Ubuntu:**
```bash
git config --global credential.helper cache
git config --global credential.helper 'cache --timeout=86400'
```

### 7.3 Install GitHub CLI

**macOS:**
```bash
brew install gh
```

**Ubuntu:**
```bash
# Add GitHub CLI repo
type -p curl >/dev/null || sudo apt install curl -y
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg
sudo chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli-stable.list > /dev/null
sudo apt update
sudo apt install gh -y
```

### 7.4 Authenticate with GitHub

Run the interactive login:
```bash
gh auth login
```

This will prompt the user to authenticate via browser or token.

### 7.5 Add Git/GH Abbreviations

These are already in the Fish config but add them explicitly if Fish config wasn't deployed:

```bash
fish -c 'abbr -a prc "gh pr create"'
fish -c 'abbr -a prv "gh pr view --web"'
```

## Verification

```bash
git --version
git config --global user.name
git config --global user.email
gh --version
gh auth status
```
