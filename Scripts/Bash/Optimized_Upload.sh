#!/bin/sh
# Description: Cleans URLs, extracts cookies once cleaned, downloads videos in parallel with yt-dlp.
# Usage: ./Upload.sh urls.txt

# Exit on error, unset variable usage, and pipe failures
set -eu

# Temporary cookies file (deleted on exit)
COOKIES_FILE=$(mktemp)
trap 'rm -f "$COOKIES_FILE"' EXIT INT TERM

# --- FUNCTIONS ---
prepare_cookies() {
    printf '%s\n' "Exporting cookies..."
    if ! yt-dlp --cookies-from-browser firefox --cookies-from-browser-export-into-netscape "$COOKIES_FILE"; then
        printf '%s\n' "Error: Failed to extract cookies." >&2
        exit 1
    fi
}

clean_urls() {
    printf '%s\n' "Cleaning download strings..."
    # Combine all sed replacements into one pass
    sed -i 's/data-dash-src=//g; s/src=//g; s/"//g' "$1"
}

download_videos() {
    printf '%s\n' "Downloading videos..."
    # Adjust -n and -P for your system/network
    #    --cookies "$COOKIES_FILE" \
    xargs -n 5 -P 8 yt-dlp \
        --concurrent-fragments 10 \
        --merge-output-format mp4 \
        -o "%(title)s.%(ext)s" < "$1"
}

# --- MAIN EXECUTION ---

if [ "$#" -ne 1 ]; then
    printf 'Usage: %s <url_file>\n' "$0" >&2
    exit 1
fi

URL_FILE=$1

if [ ! -f "$URL_FILE" ]; then
    printf 'Error: File "%s" not found.\n' "$URL_FILE" >&2
    exit 1
fi

#prepare_cookies
clean_urls "$URL_FILE"
download_videos "$URL_FILE"
