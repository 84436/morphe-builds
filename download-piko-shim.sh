#!/bin/bash

function aria() {
  aria2c --continue --async-dns=false --max-connection-per-server=16 --split=16 --max-tries=3 "$@"
}

echo "Fetching URL for Piko Shim Bundle..."
shim_bundle_url=$(
  curl -sL "https://gitlab.com/inotia00/x-shim/-/raw/main/patches-bundle.json" |\
  jq -r '.download_url'
)

echo "Fetching URL for Piko Shim List..."
shim_list_url="https://gitlab.com/inotia00/x-shim/-/raw/main/patches-list.json"

aria -o piko-shim.mpp "$shim_bundle_url"
aria -o piko-shim.json "$shim_list_url"
