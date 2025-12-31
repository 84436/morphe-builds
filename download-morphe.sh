#!/bin/bash

function aria() {
  aria2c --continue --max-connection-per-server=16 --split=16 --max-tries=3 "$@"
}

echo "Fetching URL for Morphe Patch Bundle..."
patch_bundle_url=$(
  curl -sL "https://github.com/MorpheApp/morphe-patches/raw/refs/heads/main/patches-bundle.json" |\
  jq -r '.download_url'
)

echo "Fetching URL for Morphe Patch List..."
patch_list_url="https://github.com/MorpheApp/morphe-patches/raw/refs/heads/main/patches-list.json"

aria -o morphe.mpp "$patch_bundle_url"
aria -o morphe.json "$patch_list_url"
