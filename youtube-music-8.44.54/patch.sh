#!/bin/bash

APP_NAME="YouTube Music"
APP_VERSION="8.44.54"

PATCHES=(
  "Change miniplayer color" # Adds an option to change the miniplayer background color to match the fullscreen player.
  "Change start page" # Adds an option to set which page the app opens in instead of the homepage.
  "Enable exclusive audio playback" # Enables the option to play audio without video.
  "Enable forced miniplayer" # Adds an option to enable forced miniplayer when switching between music videos, podcasts, or songs.
  "Force original audio" # Adds an option to always use the original audio track.
  "GmsCore support" # Allows the app to work without root by using a different package name when patched using a GmsCore instead of Google Play Services.
  "Hide 'Get Music Premium'" # Adds an option to hide the "Get Music Premium" label in the settings and account menu.
  "Hide buttons" # Adds options to hide the cast, history, notification, and search buttons.
  "Hide category bar" # Adds an option to hide the category bar at the top of the homepage.
  "Hide music video ads" # Adds an option to hide ads that appear while listening to or streaming music videos, podcasts, or songs.
  "Miniplayer previous and next buttons" # Adds options to show previous and next track buttons in the miniplayer.
  "Navigation bar" # Adds options to hide navigation bar, labels and buttons.
  "Permanent repeat" # Adds an option to always repeat even if the playlist ends or another track is played.
  "Remove background playback restrictions" # Removes restrictions on background playback, including playing kids videos in the background.
  "Sanitize sharing links" # Removes the tracking query parameters from shared links.
  "Spoof video streams" # Adds options to spoof the client video streams to fix playback.
  "Theme" # Adds options for theming and applies a custom background theme (dark background theme defaults to pure black).
  # "Bypass certificate checks" # Bypasses certificate checks which prevent YouTube Music from working on Android Auto.
  # "Change header" # Adds an option to change the header logo in the top left corner of the app.
  # "Check watch history domain name resolution" # Checks if the device DNS server is preventing user watch history from being saved.
  # "Custom branding" # Adds options to change the app icon and app name. Branding cannot be changed for mounted (root) installations.
  # "Disable DRC audio" # Adds an option to disable DRC (Dynamic Range Compression) audio.
  # "Disable QUIC protocol" # Adds an option to disable QUIC (Quick UDP Internet Connections) network protocol.
  # "Enable debugging" # Adds options for debugging and exporting Morphe logs to the clipboard.
)

THIS=$(realpath "$(dirname "$0")")
"$THIS/../patch-with-morphe.sh" "$THIS" "$APP_NAME" "$APP_VERSION" "${PATCHES[@]}"
