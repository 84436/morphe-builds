#!/bin/bash

APP_NAME="YouTube"
APP_VERSION="20.45.36"

PATCHES=(
  "Ambient mode" # Adds options to bypass power saving restrictions for Ambient mode and disable it entirely or in fullscreen.
  "Bypass URL redirects" # Adds an option to bypass URL redirects and open the original URL directly.
  "Change start page" # Adds an option to set which page the app opens in instead of the homepage.
  "Disable layout updates" # Adds an option to disable server side layout updates and use an older UI.
  "Disable player popup panels" # Adds an option to disable panels (such as live chat) from opening automatically.
  "Disable rolling number animations" # Adds an option to disable rolling number animations of video view count, user likes, and upload time.
  "Disable Shorts resuming on startup" # Adds an option to disable Shorts from resuming on app startup when Shorts were last being watched.
  "Disable sign in to TV popup" # Adds an option to disable the popup asking to sign into a TV on the same local network.
  "Force original audio" # Adds an option to always use the original audio track.
  "GmsCore support" # Allows the app to work without root by using a different package name when patched using a GmsCore instead of Google Play Services.
  "Hide ads" # Adds options to remove general ads.
  "Hide autoplay preview" # Adds an option to hide the autoplay preview at the end of videos.
  "Hide end screen cards" # Adds an option to hide suggested video cards at the end of videos.
  "Hide end screen suggested video" # Adds an option to hide the suggested video at the end of videos.
  "Hide layout components" # Adds options to hide general layout components.
  "Hide player flyout menu components" # Adds options to hide menu components that appear when pressing the gear icon in the video player.
  "Hide player overlay buttons" # Adds options to hide the player Cast, Autoplay, Captions, Previous & Next buttons, and the player control buttons background.
  "Hide related video overlay" # Adds an option to hide the related video overlay shown when swiping up in fullscreen.
  "Hide related videos" # Adds options to hide related videos.
  "Hide Shorts components" # Adds options to hide components related to Shorts.
  "Hide video action buttons" # Adds options to hide action buttons (such as the Download button) under videos.
  "Miniplayer" # Adds options to change the in-app minimized player.
  "Navigation bar" # Adds options to hide and change the bottom navigation bar (such as the Shorts button)  and the upper navigation toolbar. Patching version 20.21.37 and lower also adds a setting to use a wide searchbar.
  "Open links externally" # Adds an option to always open links in your browser instead of the in-app browser.
  "Open Shorts in regular player" # Adds options to open Shorts in the regular video player.
  "Open system share sheet" # Adds an option to always open the system share sheet instead of the in-app share sheet.
  "Open videos fullscreen" # Adds an option to open videos in full screen portrait mode.
  "Override YouTube Music actions" # Overrides the YouTube Music button to open Morphe Music directly.
  "Reload video" # Adds an option to display reload video button in the video player.
  "Remove background playback restrictions" # Removes restrictions on background playback, including playing kids videos in the background.
  "Remove viewer discretion dialog" # Adds an option to remove the dialog that appears when opening a video that has been age-restricted by accepting it automatically. This does not bypass the age restriction.
  "Sanitize sharing links" # Removes the tracking query parameters from shared links.
  "SponsorBlock" # Adds options to enable and configure SponsorBlock, which can skip undesired video segments such as sponsored content.
  "Spoof video streams" # Adds options to spoof the client video streams to fix playback.
  "Theme" # Adds options for theming and applies a custom background theme (dark background theme defaults to pure black).
  "Video ads" # Adds an option to remove ads in the video player.
  "Video quality" # Adds options to set default video qualities and always use the advanced video quality menu.
  # "Alternative thumbnails" # Adds options to replace video thumbnails using the DeArrow API or image captures from the video.
  # "Bypass image region restrictions" # Adds an option to use a different host for user avatar and channel images and can fix missing images that are blocked in some countries.
  # "Captions" # Adds an option to disable captions from being automatically enabled or to set caption cookies.
  # "Change form factor" # Adds an option to change the UI appearance to a phone, tablet, or automotive device.
  # "Change header" # Adds an option to change the header logo in the top left corner of the app.
  # "Check watch history domain name resolution" # Checks if the device DNS server is preventing user watch history from being saved.
  # "Copy video URL" # Adds options to display buttons in the video player to copy video URLs.
  # "Custom branding" # Adds options to change the app icon and app name. Branding cannot be changed for mounted (root) installations.
  # "Custom player overlay opacity" # Adds an option to change the opacity of the video player background when player controls are visible.
  # "Disable double tap actions" # Adds an option to disable player double tap gestures.
  # "Disable DRC audio" # Adds an option to disable DRC (Dynamic Range Compression) audio.
  # "Disable haptic feedback" # Adds an option to disable haptic feedback in the player for various actions.
  # "Disable QUIC protocol" # Adds an option to disable QUIC (Quick UDP Internet Connections) network protocol.
  # "Disable video codecs" # Adds options to disable HDR and VP9 codecs.
  # "Double tap to seek" # Adds additional double-tap to seek values to the YouTube settings menu.
  # "Downloads" # Adds support to download videos with an external downloader app using the in-app download button or a video player action button.
  # "Enable debugging" # Adds options for debugging and exporting Morphe logs to the clipboard.
  # "Exit fullscreen mode" # Adds options to automatically exit fullscreen mode when a video reaches the end.
  # "Hide info cards" # Adds an option to hide info cards that creators add in the video player.
  # "Hide timestamp" # Adds an option to hide the timestamp in the bottom left of the video player.
  # "Loop video" # Adds an option to loop videos and display loop video button in the video player.
  # "Play all" # Adds an option to play all the videos from a channel and to display play all button in the video player.
  # "Playback speed" # Adds options to customize available playback speeds, set a default playback speed, and show a speed dialog button in the video player.
  # "Return YouTube Dislike" # Adds an option to show the dislike count of videos with Return YouTube Dislike.
  # "Seekbar" # Adds options to disable precise seeking when swiping up on the seekbar, slide to seek instead of playing at 2x speed when pressing and holding, tapping the player seekbar to seek, hiding the video player seekbar, enabling seeking in livestreams, and expanding the livestream DVR duration.
  # "Shorts autoplay" # Adds options to automatically play the next Short.
  # "Spoof app version" # Adds an option to trick YouTube into thinking you are running an older version of the app. This can be used to restore old UI elements and features.
  # "Spoof device dimensions" # Adds an option to spoof the device dimensions which can unlock higher video qualities.
  # "Swipe controls" # Adds options to enable and configure volume and brightness swipe controls.
)

THIS=$(realpath "$(dirname "$0")")
"$THIS/../patch-with-morphe.sh" "$THIS" "$APP_NAME" "$APP_VERSION" "${PATCHES[@]}"
