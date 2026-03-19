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

set -gx PATH /opt/homebrew/bin /opt/homebrew/sbin $HOME/.local/bin $PATH

# Initialize zoxide (smart cd)
zoxide init fish | source

# Fish 4.x Tide fix - suppress _tide_pwd errors
if functions -q _tide_pwd
    functions -c _tide_pwd _tide_pwd_original
    function _tide_pwd
        _tide_pwd_original 2>/dev/null
    end
end

# --- Abbreviations ---

# Claude Code
abbr -a -- cc claude
abbr -a -- ccw 'claude --worktree'

# Modern CLI replacements
abbr -a -- cat 'bat --plain'
abbr -a -- ls 'eza --icons --git'
abbr -a -- ll 'eza -la --icons --git'
abbr -a -- lt 'eza --tree --level=2 --icons'
abbr -a -- grep rg
abbr -a tree "eza --tree --icons"
