#!/usr/bin/env bash
# Verify that all tools are installed and accessible
# Outputs a checklist with pass/fail for each tool

set -uo pipefail

PASS=0
FAIL=0
OS="$(uname -s)"

check_tool() {
    local name="$1"
    local cmd="$2"

    if command -v "$cmd" >/dev/null 2>&1; then
        local version
        version=$("$cmd" --version 2>/dev/null | head -1) || version="installed"
        printf "  ✅ %-12s %s\n" "$name" "$version"
        PASS=$((PASS + 1))
    else
        printf "  ❌ %-12s not found\n" "$name"
        FAIL=$((FAIL + 1))
    fi
}

echo "========================================"
echo "  Workstation Bootstrap — Verification"
echo "========================================"
echo ""

echo "Shell & Terminal:"
check_tool "fish" "fish"
if [ "$OS" = "Darwin" ]; then
    check_tool "ghostty" "ghostty"
fi
echo ""

echo "CLI Tools:"
check_tool "bat" "bat"
check_tool "eza" "eza"
check_tool "ripgrep" "rg"
check_tool "fd" "fd"
check_tool "fzf" "fzf"
check_tool "zoxide" "zoxide"
check_tool "jq" "jq"
check_tool "btop" "btop"
check_tool "dust" "dust"
check_tool "duf" "duf"
check_tool "httpie" "http"
check_tool "tldr" "tldr"
echo ""

echo "Terminal Multiplexer:"
check_tool "tmux" "tmux"
echo ""

echo "Development:"
check_tool "vim" "vim"
check_tool "git" "git"
check_tool "gh" "gh"
check_tool "node" "node"
check_tool "python3" "python3"
check_tool "docker" "docker"
check_tool "claude" "claude"
echo ""

echo "========================================"
printf "  Results: %d passed, %d failed\n" "$PASS" "$FAIL"
echo "========================================"

if [ "$FAIL" -gt 0 ]; then
    exit 1
fi
