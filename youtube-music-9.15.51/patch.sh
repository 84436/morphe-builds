#!/bin/bash

APP_NAME="YouTube Music"
APP_VERSION="9.15.51"

PATCHES=(
  "Change miniplayer color" # Adds an option to change the miniplayer background color to match the fullscreen player.
  "Change start page" # Adds an option to set which page the app opens in instead of the homepage.
  "Disable dislike redirection" # Adds an option to prevent skipping to the next track when the dislike button is pressed.
  "Enable exclusive audio playback" # Enables the option to play audio without video.
  "Enable forced miniplayer" # Adds an option to enable forced miniplayer when switching between music videos, podcasts, or songs.
  "Force original audio" # Adds an option to always use the original audio track.
  "GmsCore support" # Allows the app to work without root by using a different package name when patched using a GmsCore instead of Google Play Services.
  "Hide ads" # Adds options to hide fullscreen ads, Premium promotions and video ads.
  "Hide buttons" # Adds options to hide the cast, history, notification, and search buttons.
  "Hide filter bar" # Adds an option to hide the filter bar at the top of the homepage.
  "Hide flyout menu components" # Adds options to hide individual items from the player and queue flyout menus.
  "Hide layout components" # Adds options to hide general layout components.
  "Hide music action buttons" # Adds options to hide action buttons under the player.
  "Miniplayer previous and next buttons" # Adds options to show previous and next track buttons in the miniplayer.
  "Navigation bar" # Adds options to hide navigation bar, labels and buttons.
  "Remember repeat state" # Adds an option to remember the repeat state when playing a new track or playlist.
  "Remember shuffle state" # Adds an option to remember the shuffle state when playing a new track or playlist.
  "Remove background playback restrictions" # Removes restrictions on background playback, including playing kids videos in the background.
  "Sanitize sharing links" # Removes the tracking query parameters from shared links.
  "SponsorBlock" # Adds options to enable and configure SponsorBlock, which can skip non-music segments.
  "Spoof video streams" # Adds options to spoof the client video streams to fix playback.
  "Theme" # Adds options for theming and applies a custom background theme (dark background theme defaults to pure black).
  "Track crossfade" # Adds a true dual-player crossfade between consecutive tracks. Requires YouTube Music 9.00 or newer; on older versions the patch is a no-op.
  # "Bypass certificate checks" # Bypasses certificate checks which prevent YouTube Music from working on Android Auto.
  # "Change header" # Adds an option to change the header logo in the top left corner of the app.
  # "Check watch history domain name resolution" # Checks if the device DNS server is preventing user watch history from being saved.
  # "Custom branding" # Adds options to change the app icon and app name. Branding cannot be changed for mounted (root) installations.
  # "Disable DRC audio" # Adds an option to disable DRC (Dynamic Range Compression) audio.
  # "Disable QUIC protocol" # Adds an option to disable QUIC (Quick UDP Internet Connections) network protocol.
  # "Downloads" # Adds support to download songs with an external downloader app using the in-app download button.
  # "Enable debugging" # Adds options for debugging and exporting Morphe logs to the clipboard.
  # "Enable swipe to dismiss miniplayer" # Adds an option to enable dismissing the miniplayer by swiping down on it.
  # "Network proxy" # Adds settings to route supported network requests through an HTTP or HTTPS proxy.
  # "Scrobbling" # Adds options to add played tracks to Last.fm and ListenBrainz.
  # "Spoof app version" # Adds an option to trick the app into thinking you are running an older version.
)

THIS=$(realpath "$(dirname "$0")")
"$THIS/../patch-with-morphe.sh" "$THIS" "$APP_NAME" "$APP_VERSION" "${PATCHES[@]}"
