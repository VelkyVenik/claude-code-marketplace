#!/usr/bin/env bash
# Detect the operating system and version
# Outputs: OS_NAME and OS_VERSION

set -euo pipefail

detect_os() {
    local os_name=""
    local os_version=""

    case "$(uname -s)" in
        Darwin)
            os_name="macOS"
            os_version="$(sw_vers -productVersion)"
            ;;
        Linux)
            if [ -f /etc/os-release ]; then
                . /etc/os-release
                os_name="$NAME"
                os_version="$VERSION_ID"
            elif [ -f /etc/lsb-release ]; then
                . /etc/lsb-release
                os_name="$DISTRIB_ID"
                os_version="$DISTRIB_RELEASE"
            else
                os_name="Linux"
                os_version="unknown"
            fi
            ;;
        *)
            echo "ERROR: Unsupported operating system: $(uname -s)" >&2
            exit 1
            ;;
    esac

    echo "OS_NAME=$os_name"
    echo "OS_VERSION=$os_version"
}

detect_os
