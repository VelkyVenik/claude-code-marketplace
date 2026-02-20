# Phase 11: SSH Authorized Keys

Set up SSH authorized keys for remote access.

## Both OS

### 11.1 Create SSH Directory

```bash
mkdir -p ~/.ssh
chmod 700 ~/.ssh
```

### 11.2 Add Authorized Keys

**Ask the user** for their SSH public key(s) to add:

> Do you have any SSH public keys to add to `~/.ssh/authorized_keys`?
> Paste your public key (e.g. `ssh-ed25519 AAAA... user@host`), or type "skip" to skip this step.

The user may provide multiple keys. For each key provided:

```bash
AUTH_KEY="<user-provided-key>"

touch ~/.ssh/authorized_keys
chmod 600 ~/.ssh/authorized_keys

# Only add if not already present
if ! grep -qF "$AUTH_KEY" ~/.ssh/authorized_keys 2>/dev/null; then
    echo "$AUTH_KEY" >> ~/.ssh/authorized_keys
    echo "SSH key added to authorized_keys"
else
    echo "SSH key already present in authorized_keys"
fi
```

**Important:** Never hardcode SSH keys. Always prompt the user for their key at runtime.

### 11.3 Verify Permissions

```bash
# Directory must be 700
chmod 700 ~/.ssh

# authorized_keys must be 600
chmod 600 ~/.ssh/authorized_keys
```

## Verification

```bash
ls -la ~/.ssh/authorized_keys
wc -l ~/.ssh/authorized_keys
```
