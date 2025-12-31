#!/bin/bash

APP_NAME="Reddit"
APP_VERSION="2026.04.0"

PATCHES=(
  "Disable Play Store updates"
  "Disable modern home" # Adds an option to disable the modern home UI.
  "Disable screenshot popup" # Adds an option to disable the popup that appears when taking a screenshot.
  "Hide ads" # Adds options to hide ads.
  "Hide navigation buttons" # Adds options to hide buttons in the navigation bar.
  "Hide recommended communities shelf" # Adds an option to hide the recommended communities shelves in subreddits.
  "Hide sidebar components" # Adds options to hide the sidebar components.
  "Hide Trending Today shelf" # Adds an option to hide the Trending Today shelf from search suggestions.
  "Open links directly" # Adds an option to skip over redirection URLs in external links.
  "Remove subreddit dialog" # Adds options to remove the NSFW community warning and notifications suggestion dialogs by dismissing them automatically.
  "Sanitize sharing links" # Adds an option to sanitize sharing links by removing tracking query parameters.
  "Show view count" # Adds an option to show the view count of Posts.
  "Spoof signature" # Spoofs the signature of the app to fix notification issues.
  # "Custom branding name for Reddit" # Changes the Reddit app name to the name specified in patch options.
)

THIS=$(realpath "$(dirname "$0")")
"$THIS/../patch-with-morphe.sh" "$THIS" "$APP_NAME" "$APP_VERSION" "${PATCHES[@]}"
