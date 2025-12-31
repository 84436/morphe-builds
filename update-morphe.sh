#!/bin/bash

echo "Fetching URL for CLI..."
cli_url=$(
  curl -sL "https://api.github.com/repos/MorpheApp/morphe-cli/releases/latest" |\
  jq -r '.assets[] | select(.name | endswith(".jar")) | .browser_download_url'
)

echo "Fetching URL for Patch Bundle..."
patch_bundle_url=$(
  curl -sL "https://github.com/MorpheApp/morphe-patches/raw/refs/heads/main/patches-bundle.json" |\
  jq -r '.download_url'
)

echo "Fetching URL for Patch List..."
patch_list_url="https://github.com/MorpheApp/morphe-patches/raw/refs/heads/main/patches-list.json"

function aria() {
  aria2c --continue --max-connection-per-server=16 --split=16 --max-tries=3 "$@"
}

aria -o cli.jar "$cli_url"
aria -o patches.mpp "$patch_bundle_url"
aria -o patches.json "$patch_list_url"
