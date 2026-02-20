# Fish Shell Configuration
# Deployed by workstation-bootstrap plugin

# Disable greeting
set -U fish_greeting

# Homebrew environment hints
set -gx HOMEBREW_NO_ENV_HINTS 1

# PATH additions
if test (uname) = "Darwin"
    fish_add_path /opt/homebrew/sbin
end
fish_add_path $HOME/.local/bin
fish_add_path $HOME/.bun/bin
fish_add_path $HOME/.local/share/fnm
fish_add_path $HOME/.cargo/bin

# Initialize fnm (if installed)
if command -q fnm
    fnm env --shell fish | source
end

# Initialize zoxide (smart cd)
if command -q zoxide
    zoxide init fish | source
end

# --- Abbreviations ---

# Claude Code
abbr -a cc claude
abbr -a ccr "claude --resume"

# Modern CLI replacements
abbr -a cat bat
abbr -a ls "eza --icons --git"
abbr -a ll "eza -la --icons --git"
abbr -a lt "eza --tree --icons"
abbr -a grep rg
abbr -a tree "eza --tree --icons"

# GitHub CLI
abbr -a prc "gh pr create"
abbr -a prv "gh pr view --web"
