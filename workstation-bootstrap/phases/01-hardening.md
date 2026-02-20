# Phase 1: Security Hardening

Secure the workstation with encryption, firewall, and automatic updates.

## macOS

### 1.1 FileVault (Full Disk Encryption)

Check if FileVault is enabled:
```bash
fdesetup status
```

If not enabled, prompt the user:
> FileVault (full disk encryption) is not enabled. This protects your data if your Mac is lost or stolen.
> **Enable FileVault now?** This will require a restart to begin encryption.

If user confirms:
```bash
sudo fdesetup enable
```
Save the recovery key and display it to the user. Remind them to store it securely.

### 1.2 macOS Firewall

```bash
# Check status
sudo /usr/libexec/ApplicationFirewall/socketfilterfw --getglobalstate

# Enable if not already on
sudo /usr/libexec/ApplicationFirewall/socketfilterfw --setglobalstate on

# Enable stealth mode (don't respond to pings)
sudo /usr/libexec/ApplicationFirewall/socketfilterfw --setstealthmode on
```

### 1.3 Lock Screen Security

```bash
# Require password immediately after sleep/screensaver
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0
```

### 1.4 Remote Login

Check if SSH is enabled:
```bash
sudo systemsetup -getremotelogin
```

If enabled, ask the user:
> Remote Login (SSH) is currently enabled. For security, it's recommended to disable it unless you need remote access.
> **Disable Remote Login?**

If user confirms:
```bash
sudo systemsetup -setremotelogin off
```

### 1.5 Automatic Updates

```bash
# Enable automatic checking
defaults write com.apple.SoftwareUpdate AutomaticCheckEnabled -bool true

# Enable automatic download
defaults write com.apple.SoftwareUpdate AutomaticDownload -bool true

# Enable auto-install of critical updates
defaults write com.apple.SoftwareUpdate CriticalUpdateInstall -bool true

# Enable auto-install of macOS updates
defaults write com.apple.SoftwareUpdate AutomaticallyInstallMacOSUpdates -bool true
```

### 1.6 Gatekeeper

```bash
# Verify Gatekeeper is enabled
spctl --status
```

If not enabled:
```bash
sudo spctl --master-enable
```

### 1.7 MDM/Intune Check

```bash
# Check for MDM enrollment
profiles status -type enrollment 2>/dev/null || echo "No MDM profiles found"
```

Report MDM status to user — if enrolled, note that some settings may be managed by their organization.

---

## Ubuntu

### 1.1 System Updates

```bash
sudo apt update && sudo apt upgrade -y
```

### 1.2 UFW Firewall

```bash
# Install if not present
sudo apt install -y ufw

# Configure rules
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw allow ssh
sudo ufw allow http
sudo ufw allow https

# Enable
sudo ufw --force enable

# Verify
sudo ufw status verbose
```

### 1.3 fail2ban

```bash
sudo apt install -y fail2ban

# Create local config
sudo cp /etc/fail2ban/jail.conf /etc/fail2ban/jail.local

# Enable and start
sudo systemctl enable fail2ban
sudo systemctl start fail2ban
```

### 1.4 SSH Hardening

```bash
# Disable root login via SSH
sudo sed -i 's/^#*PermitRootLogin.*/PermitRootLogin no/' /etc/ssh/sshd_config
sudo sed -i 's/^#*PasswordAuthentication.*/PasswordAuthentication yes/' /etc/ssh/sshd_config

# Restart SSH (modern Ubuntu uses ssh.service, older uses sshd.service)
sudo systemctl restart ssh || sudo systemctl restart sshd
```

### 1.5 Unattended Upgrades

```bash
sudo apt install -y unattended-upgrades
sudo dpkg-reconfigure -plow unattended-upgrades
```

## Verification

After completing hardening, display a summary:
- Encryption: enabled/disabled
- Firewall: active/inactive
- Auto-updates: configured/not configured
- SSH: hardened/not applicable
