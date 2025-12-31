#!/bin/bash

APP_NAME="YouTube Music"
APP_VERSION="9.30.53"

PATCHES=(
  "App refresh rate" # Adds an option to change the app refresh rate.
  "Change miniplayer color" # Adds an option to change the miniplayer background color to match the fullscreen player.
  "Change start page" # Adds an option to set which page the app opens in instead of the homepage.
  "Crossfade" # Adds a true dual-player crossfade between consecutive tracks.
  "Disable dislike redirection" # Adds an option to prevent skipping to the next track when the dislike button is pressed.
  "Enable audio/video switch" # Adds an option to switch between the audio and the video version of a track by redirecting videoId.
  "Enable exclusive audio playback" # Enables the option to play audio without video.
  "Enable forced miniplayer" # Adds an option to enable forced miniplayer when switching between music videos, podcasts, or songs.
  "Force original audio" # Adds an option to always use the original audio track.
  "GmsCore support" # Allows the app to work without root by using a different package name when patched using a GmsCore instead of Google Play Services.
  "Hide ads" # Adds options to hide fullscreen ads, Premium promotions and video ads.
  "Hide buttons" # Adds options to hide the cast, history, notification, search, voice search, sound search, and Library New buttons.
  "Hide flyout menu components" # Adds options to hide individual items from the player and queue flyout menus.
  "Hide layout components" # Adds options to hide general layout components.
  "Hide music action buttons" # Adds options to hide action buttons under the player.
  "Media notification controls" # Adds options to disable the seekbar and previous/next buttons in the media notification and headphone controls.
  "Miniplayer previous and next buttons" # Adds options to show previous and next track buttons in the miniplayer.
  "Navigation bar" # Adds options to hide navigation bar, labels and buttons.
  "Play albums songs" # Adds an option to play the song version of album tracks instead of music videos.
  "Playback speed" # Adds options to change the playback speed and pitch of tracks.
  "Playlist track tap action" # Adds an option to play only the tapped track of a playlist or album, or to add it to the queue, instead of replacing the queue with the whole playlist.
  "Remember repeat state" # Adds an option to remember the repeat state when playing a new track or playlist.
  "Remember shuffle state" # Adds an option to remember the shuffle state when playing a new track or playlist.
  "Remove background playback restrictions" # Removes restrictions on background playback, including playing kids videos in the background.
  "Remove viewer discretion dialog" # Adds an option to remove the dialog that appears when opening a video that has been age-restricted by accepting it automatically. This does not bypass the age restriction.
  "Sanitize sharing links" # Removes the tracking query parameters from shared links.
  "Skip silence" # Adds an option to automatically skip silent pauses in audio playback.
  "SoundProof" # Adds an option to skip tracks of artists reported as AI in the SoundProof community database.
  "SponsorBlock" # Adds options to enable and configure SponsorBlock, which can skip non-music segments.
  "Spoof video streams" # Adds options to spoof the client video streams to fix playback.
  "Theme" # Adds options for theming, and settings to change the app foreground and background colors.
  "Third-party lyrics" # Adds an option to show synced lyrics with experience enhancement from 19+ providers in the lyrics panel.
  # "Android Auto" # Bypasses certificate checks and restores YouTube Music Home recommendations, Library collections, and podcasts in Android Auto.
  # "Change header" # Adds an option to change the header logo in the top left corner of the app.
  # "Check watch history domain name resolution" # Checks if the device DNS server is preventing user watch history from being saved.
  # "Custom branding" # Adds options to change the app icon and app name. For mounted (root) installations the branding is applied while patching, because it cannot be changed from the app settings.
  # "Custom font" # Adds an option to show the app with the device system font or a custom TTF or OTF font file instead of YouTube Sans.
  # "Disable DRC audio" # Adds an option to disable DRC (Dynamic Range Compression) audio.
  # "Disable QUIC protocol" # Adds an option to disable QUIC (Quick UDP Internet Connections) network protocol.
  # "Downloads" # Adds support to download songs, albums and playlists using the in-app download button, either with an external downloader app or inside YouTube Music.
  # "Enable debugging" # Adds options for debugging and exporting Morphe logs to the clipboard.
  # "Enable swipe to dismiss miniplayer" # Adds an option to enable dismissing the miniplayer by swiping down on it.
  # "Force portrait orientation" # Adds an option to keep the app in portrait orientation when the device is rotated.
  # "Jam queue sharing" # Shares the host queue and playback controls through an authenticated Jam bridge. Root installation is not supported.
  # "Network proxy" # Adds settings to route supported network requests through an HTTP or HTTPS proxy. Including this patch may cause connectivity problems on certain devices
  # "Playlist tags" # Adds an option to tag playlists from their menu, and to filter the Library playlists by tag.
  # "PoToken provider" # Adds option to get PoToken using an external PoToken minter app.
  # "Return YouTube Dislike" # Adds an option to show the dislike count of tracks with Return YouTube Dislike.
  # "Scrobbling" # Adds options to add played tracks to Last.fm and ListenBrainz.
  # "Settings menu filter" # Adds an option to hide items on the standard YouTube Music settings screen by their visible name.
  # "Spoof app version" # Adds an option to trick the app into thinking you are running an older version.
)

THIS=$(realpath "$(dirname "$0")")
"$THIS/../patch-with-morphe.sh" "$THIS" "$APP_NAME" "$APP_VERSION" "${PATCHES[@]}"
