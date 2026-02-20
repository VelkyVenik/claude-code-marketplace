# /setup — Workstation Bootstrap Entry Point

Run the full workstation bootstrap process interactively.

## Instructions

You are starting the workstation bootstrap process. Follow these steps exactly:

### Step 1: Detect OS

Run the OS detection script to determine whether this is macOS or Ubuntu:

```bash
bash "$(dirname "$0")/../scripts/detect-os.sh"
```

Store the result and display it to the user:
> Detected OS: **<os_name> <version>**

### Step 2: Initialize Logging

Create or append to the setup log:

```bash
echo "" >> ~/workstation-setup.log
echo "========================================" >> ~/workstation-setup.log
echo "Workstation Bootstrap — $(date '+%Y-%m-%d %H:%M:%S')" >> ~/workstation-setup.log
echo "OS: <detected_os>" >> ~/workstation-setup.log
echo "========================================" >> ~/workstation-setup.log
```

### Step 3: Run Phases

Execute each phase sequentially. Before each phase:

1. Read the phase file from `phases/`
2. Display a summary of what will be installed/configured
3. Ask the user: **"Proceed with Phase N: <name>? [Y/n/skip]"**
4. If user says Y or yes — execute the phase
5. If user says n or no — stop the entire bootstrap
6. If user says skip — skip this phase and move to the next

### Step 4: Backup Before Config Changes

Before any phase that deploys config files (phases 3, 4, 6, 7, 10, 12), run:

```bash
bash "$(dirname "$0")/../scripts/backup-dotfiles.sh"
```

Only run the backup once (on the first config-deploying phase).

### Step 5: Final Verification

After all phases complete (or are skipped), run:

```bash
bash "$(dirname "$0")/../scripts/verify-install.sh"
```

Display the results and log them.

### Step 6: Summary

Show a final summary:
- Which phases were completed
- Which phases were skipped
- Any errors encountered
- Location of the log file (`~/workstation-setup.log`)

## Error Handling

If any phase fails:
1. Log the error to `~/workstation-setup.log`
2. Display the error to the user
3. Attempt to diagnose and suggest a fix
4. Ask: **"Continue to the next phase? [Y/n]"**
