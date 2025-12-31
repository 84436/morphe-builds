#!/bin/bash

APP_NAME="Twitter"
APP_VERSION="12.0.0-release.0"

PATCHES=(
  "Add ability to copy media link"
  "Block redirecting to X Lite" # Blocks redirecting to the new X Android UI on launch
  "Bring back twitter" # Bring back old twitter logo and name
  "Change version code" # Changes the version code of the app. This will turn off app store updates and allows downgrading an existing app install to an older app version.
  "Clear tracking params" # Removes tracking parameters when sharing links
  "Control video auto scroll" # Control video auto scroll in immersive view
  "Custom download folder" # Change the download directory for video downloads
  "Custom sharing domain" # Allows for using domains like fxtwitter when sharing tweets/posts.
  "Customize default reply sorting"
  "Customize explore tabs"
  "Customize Inline action Bar items"
  "Customize Navigation Bar items"
  "Customize notification tabs"
  "Customize profile tabs"
  "Customize search suggestions"
  "Customize search tab items"
  "Customize side bar items"
  "Customize timeline top bar"
  "Delete from database" # Delete entries from database(cache)
  "Disable auto timeline scroll on launch"
  "Disable chirp font"
  "Download patch" # Unlocks the ability to download videos and gifs from Twitter/X
  "Enable force HD videos" # Videos will be played in highest quality always
  "Enable Undo Posts" # Enables ability to undo posts before posting
  "Handle custom twitter links" # Adds support for opening custom twitter links such as vxtwitter, fxtwitter, and fixupx within the app. These will have to be manually enabled under the "Open by default" section in the app info!
  "Hide badges from navigation bar icons" # Hides notification nudges & counts from navigation bar icons
  "Hide Banner" # Hide new post banner
  "Hide bookmark icon in timeline"
  "Hide community badges"
  "Hide Community Notes"
  "Hide FAB Menu Buttons"
  "Hide FAB" # Adds an option to hide Floating action button
  "Hide followed by context" # Hides followed by context under profile
  "Hide hidden replies"
  "Hide immersive player" # Removes swipe up for more videos in video player
  "Hide Live Threads"
  "Hide nudge button" # Hides follow/subscribe/follow back buttons on posts
  "Hide post metrics" # Hides like, reposts etc counts.
  "Hide promote button" # Hides promote button under self posts
  "Hide recommendation items" # Adds options to hide recommendation items such as "Who to follow" and "Today's news" in timeline, search, and replies.
  "Hide Recommended Users" # Hide recommended users that pops up when you follow someone
  "Import/Export login token" # Adds an feature to export and import the token of accounts. This is useful when logging in on your second device or when re-installing piko.
  "Legacy share links" # Brings back username on post share links. Works post 11.4x.xx
  "Native downloader" # Requires X 11.0.0-release.0 or higher.
  "Native translator" # Requires X 11.0.0-release.0 or higher.
  "No shortened URL" # Get rid of t.co short urls.
  "Pause search suggestions" # Search suggestions will not be saved locally
  "Remove Ads" # Removed promoted posts, trends and google ads
  "Remove premium upsell" # Removes premium upsell in home timeline
  "Remove search suggestions" # Hide/Remove search suggestion in explore section
  "Remove view count" # Removes the view count from the bottom of tweets
  "Round off numbers" # Enable or disable rounding off numbers
  "Selectable Text" # Makes bio and username selectable
  "Show poll results" # Adds an option to show poll results without voting
  "Show post source label" # Source label will be shown only on public posts
  "Show sensitive media"
  # "Browse tweet object" # Adds an option to browse the tweet object in the share menu.
  # "Change app icon"
  # "Custom emoji font" # Customise emoji font style
  # "Custom font" # Customise font style
  # "Customise post font size"
  # "Disunify xchat system" # Bring back legacy features like messages and share sheet.
  # "Dynamic color" # Replaces the default Twitter Blue with the user's Material You palette.
  # "Enable debug menu for posts"
  # "Enable PiP mode automatically" # Enables PiP mode when you close the app
  # "Export all activities" # Makes all app activities exportable.
  # "Force enable translate" # Get translate option for all posts
  # "Hook feature flag"
  # "Log server response" # Log json responses received from server
  # "Native reader mode" # Requires X 11.0.0-release.0 or higher.
  # "Share Tweet as Image" # Share tweets as rendered image. Requires X 11.0.0-release.0 or higher.
  # "Show changelogs" # Shows changelogs when new a patch is installed.
)

THIS=$(realpath "$(dirname "$0")")
"$THIS/../patch-with-piko.sh" "$THIS" "$APP_NAME" "$APP_VERSION" "${PATCHES[@]}"
