#!/bin/bash

echo "Fetching URL for Piko Patch Bundle..."
patch_bundle_url=$(
  curl -sL "https://github.com/crimera/piko/raw/refs/heads/main/patches-bundle.json" |\
  jq -r '.download_url'
)

echo "Fetching URL for Piko Patch List..."
patch_list_url="https://github.com/crimera/piko/raw/refs/heads/main/patches-list.json"

echo "Fetching URL for Piko Shim Bundle..."
shim_bundle_url=$(
  curl -sL "https://gitlab.com/inotia00/x-shim/-/raw/main/patches-bundle.json" |\
  jq -r '.download_url'
)

echo "Fetching URL for Piko Shim List..."
shim_list_url="https://gitlab.com/inotia00/x-shim/-/raw/main/patches-list.json"

function aria() {
  aria2c --continue --max-connection-per-server=16 --split=16 --max-tries=3 "$@"
}

aria -o piko.mpp "$patch_bundle_url"
aria -o piko.json "$patch_list_url"
aria -o piko-shim.mpp "$shim_bundle_url"
aria -o piko-shim.json "$shim_list_url"
