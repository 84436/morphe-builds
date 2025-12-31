#!/bin/bash

function aria() {
  aria2c --continue --max-connection-per-server=16 --split=16 --max-tries=3 "$@"
}

echo "Fetching URL for Morphe CLI..."
cli_url=$(
  curl -sL "https://api.github.com/repos/MorpheApp/morphe-desktop/releases/latest" |\
  jq -r '.assets[] | select(.name | endswith(".jar")) | .browser_download_url'
)

aria -o cli.jar "$cli_url"
