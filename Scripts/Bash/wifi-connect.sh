#!/usr/bin/env bash
#
# wifi-connect.sh - connect to a Wi-Fi network with nmcli.
#
# Features: numbered network menu, saved-profile reuse, open networks,
# hidden SSIDs, retry limit, and passwords that never touch the command line
# (nmcli prompts for them itself via --ask).
#
# Requires: bash 4+, NetworkManager (nmcli). sudo is normally not needed.

set -u -o pipefail

readonly MAX_ATTEMPTS=3

# ---------------------------------------------------------------- helpers ---

die() { echo "Error: $*" >&2; exit 1; }

confirm() {  # confirm "Prompt" default(y|n)
    local prompt=$1 default=${2:-y} reply
    read -rp "$prompt " reply || exit 0
    reply=${reply:-$default}
    [[ $reply =~ ^[Yy] ]]
}

profile_exists() {
    local names
    names=$(nmcli -g NAME connection show 2>/dev/null) || return 1
    grep -Fxq -- "$1" <<<"$names"
}

delete_profile() {
    profile_exists "$1" && nmcli connection delete id "$1" >/dev/null 2>&1
    return 0
}

is_open() { [[ -z $1 || $1 == "--" ]]; }

# ------------------------------------------------------------- preflight ----

preflight() {
    command -v nmcli >/dev/null 2>&1 || die "nmcli not found. Install NetworkManager."
    nmcli general status >/dev/null 2>&1 || die "NetworkManager is not running."

    if [[ $(nmcli radio wifi) != enabled ]]; then
        echo "Wi-Fi radio is off. Turning it on..."
        nmcli radio wifi on || die "Could not enable the Wi-Fi radio."
        sleep 2
    fi
}

# --------------------------------------------------------------- scanning ---

declare -a SSIDS=() SECS=() SIGS=()

scan() {
    SSIDS=(); SECS=(); SIGS=()
    local -A seen=()
    local signal security ssid

    echo "Scanning for networks..."
    nmcli dev wifi rescan >/dev/null 2>&1 || true   # can fail if scanned recently
    sleep 2

    # Terse mode escapes ':' and '\' inside fields, so SSID goes last and is unescaped.
    while IFS=: read -r signal security ssid; do
        ssid=${ssid//\\:/:}
        ssid=${ssid//\\\\/\\}
        [[ -z $ssid || -n ${seen[$ssid]:-} ]] && continue   # skip hidden/duplicates
        seen[$ssid]=1
        SSIDS+=("$ssid"); SECS+=("$security"); SIGS+=("$signal")
    done < <(nmcli -t -f SIGNAL,SECURITY,SSID dev wifi list | sort -t: -k1,1nr)
}

show_menu() {
    local i sec
    echo
    if ((${#SSIDS[@]} == 0)); then
        echo "  (no visible networks found)"
    fi
    for i in "${!SSIDS[@]}"; do
        sec=${SECS[i]}
        is_open "$sec" && sec="open"
        printf '%3d) %-32s %3s%%  %s\n' "$((i + 1))" "${SSIDS[i]}" "${SIGS[i]}" "$sec"
    done
    echo
    echo "  r) rescan   h) hidden network   q) quit"
}

# ------------------------------------------------------------- connecting ---

# attempt_loop SSID CMD... : run CMD up to MAX_ATTEMPTS times.
attempt_loop() {
    local ssid=$1 n; shift
    for ((n = 1; n <= MAX_ATTEMPTS; n++)); do
        echo "Connecting to '$ssid' (attempt $n of $MAX_ATTEMPTS)..."
        if "$@"; then
            echo "Connected to '$ssid'."
            return 0
        fi
        echo "Connection failed." >&2
        ((n < MAX_ATTEMPTS)) || break
        confirm "Try again? [Y/n]" y || break
    done
    return 1
}

try_visible() {  # nmcli prompts for the password itself when one is needed
    local ssid=$1 security=$2
    if is_open "$security"; then
        nmcli dev wifi connect "$ssid" && return 0
    else
        nmcli --ask dev wifi connect "$ssid" && return 0
    fi
    delete_profile "$ssid"   # don't leave a profile holding a bad password
    return 1
}

connect_visible() {
    local ssid=$1 security=$2

    if profile_exists "$ssid"; then
        echo "Found a saved profile for '$ssid'; trying it..."
        if nmcli connection up id "$ssid"; then
            echo "Connected to '$ssid'."
            return 0
        fi
        echo "The saved profile failed (password may have changed)." >&2
        confirm "Forget it and enter the password again? [y/N]" n || return 1
        delete_profile "$ssid"
    fi

    attempt_loop "$ssid" try_visible "$ssid" "$security"
}

connect_hidden() {
    local ssid secured=yes
    read -rp "Hidden network name (SSID): " ssid || exit 0
    [[ -n $ssid ]] || { echo "No name entered."; return 1; }

    if profile_exists "$ssid"; then
        echo "Found a saved profile for '$ssid'; trying it..."
        nmcli connection up id "$ssid" && { echo "Connected to '$ssid'."; return 0; }
        echo "The saved profile failed." >&2
        confirm "Forget it and start over? [y/N]" n || return 1
        delete_profile "$ssid"
    fi

    confirm "Does it require a password? [Y/n]" y || secured=no

    local -a args=(connection add type wifi ifname '*'
                   con-name "$ssid" ssid "$ssid" wifi.hidden yes)
    [[ $secured == yes ]] && args+=(wifi-sec.key-mgmt wpa-psk)
    nmcli "${args[@]}" >/dev/null || { echo "Could not create profile." >&2; return 1; }

    local -a up=(nmcli)
    [[ $secured == yes ]] && up+=(--ask)
    up+=(connection up id "$ssid")

    if attempt_loop "$ssid" "${up[@]}"; then
        return 0
    fi
    delete_profile "$ssid"
    return 1
}

# ------------------------------------------------------------------- main ---

main() {
    preflight

    local choice idx
    while true; do
        scan
        show_menu
        read -rp "Choose a network [1-${#SSIDS[@]}]: " choice || exit 0

        case $choice in
            q|Q) echo "Bye."; exit 0 ;;
            r|R) continue ;;
            h|H) connect_hidden && exit 0 ;;
            *)
                if [[ $choice =~ ^[0-9]+$ ]] && ((choice >= 1 && choice <= ${#SSIDS[@]})); then
                    idx=$((choice - 1))
                    connect_visible "${SSIDS[idx]}" "${SECS[idx]}" && exit 0
                else
                    echo "Invalid choice."
                fi
                ;;
        esac
    done
}

main "$@"
