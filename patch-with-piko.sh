#!/bin/bash

THIS=$(realpath "$(dirname "$0")")

APP_FOLDER="$1"
APP_NAME="$2"
APP_VERSION="$3"
shift 3
PATCHES=("$@")

CLI_PATH="$THIS/cli.jar"
PATCH_BUNDLE_PATH="$THIS/piko.mpp"
SHIM_BUNDLE_PATH="$THIS/piko-shim.mpp"
PATCH_LIST_PATH="$THIS/piko.json"
KEYSTORE_PATH="$THIS/morphe.bks"

PATCH_BUNDLE_VERSION=$(jq -r '.version' $"$PATCH_LIST_PATH")
INPUT_FILE_PATH="$APP_FOLDER/original.apk"
OUTPUT_FILE_PATH="$APP_FOLDER/$APP_NAME ($APP_VERSION-piko-$PATCH_BUNDLE_VERSION).apk"
TEMP_FILES_PATH="$APP_FOLDER/temp"

PATCH_ARGS=()
for patch in "${PATCHES[@]}"; do {
  PATCH_ARGS+=("--enable=$patch")
}; done

rm -rf "$TEMP_FILES_PATH"

java -jar "$CLI_PATH" patch \
  --patches="$PATCH_BUNDLE_PATH" \
  --exclusive \
  "${PATCH_ARGS[@]}" \
  --patches="$SHIM_BUNDLE_PATH" \
  --enable="Abstract shim layer" \
  --enable="Abstract shim layer for method" \
  --enable="Abstract shim layer for native library" \
  --striplibs="arm64-v8a" \
  --keystore="$KEYSTORE_PATH" \
  --keystore-password="morphe" \
  --keystore-entry-alias="morphe" \
  --keystore-entry-password="morphe" \
  --temporary-files-path="$TEMP_FILES_PATH" \
  --out="$OUTPUT_FILE_PATH" \
  "$INPUT_FILE_PATH"

rm -rf "$TEMP_FILES_PATH"
