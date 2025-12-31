#!/usr/bin/env python3

import sys
import json
from pathlib import Path

if len(sys.argv) != 2 or (sys.argv[1] != 'before' and sys.argv[1] != 'after'):
  raise SystemExit('before or after?')

THIS = Path(__file__).resolve()
WORKING_FOLDER = THIS.parent

# Known package names
YouTube = 'com.google.android.youtube'
YouTubeMusic = 'com.google.android.apps.youtube.music'
Reddit = 'com.reddit.frontpage'
Twitter = 'com.twitter.android'
Instagram = 'com.instagram.android'

patch_bundle_json_path = Path(WORKING_FOLDER, 'morphe.json')
# patch_bundle_json_path = Path(WORKING_FOLDER, 'piko.json')
if not patch_bundle_json_path.is_file():
  raise SystemExit(f"Where's the patch bundle JSON file?\n{patch_bundle_json_path}")

patch_bundle = json.loads(patch_bundle_json_path.read_text())
patches = patch_bundle['patches']

is_universal_patch = lambda patch: type(patch['compatiblePackages']) is not list
is_experimental_target = lambda target: target['isExperimental'] == True

non_universal_patches = [
  patch
  for patch in patches
  if not is_universal_patch(patch)
]

available_targets = sorted(
  set(
    (package['packageName'], target['version'])
    for patch in non_universal_patches
    for package in patch['compatiblePackages']
    for target in package['targets']
    if not is_experimental_target(target)
  ),
  reverse=True
)

def highest_version_of(package_name):
  matching_targets = [
    version
    for name, version in available_targets
    if name == package_name
  ]
  return matching_targets[0] if len(matching_targets) > 0 else None

def patches_and_description_for(package_name):
  return sorted(
    f"\"{patch['name']}\" # {patch['description']}"
    for patch in non_universal_patches
    if package_name in [
      package['packageName']
      for package in patch['compatiblePackages']
    ]
  )

def app_version_and_patches_for(package_name):
  output_file = Path(WORKING_FOLDER, f"{sys.argv[1]}-{package_name}.txt")
  output_file.write_text('\n'.join([
    highest_version_of(package_name),
    '\n'.join(patches_and_description_for(package_name))
  ]))
  print(package_name)

app_version_and_patches_for(YouTube)
app_version_and_patches_for(YouTubeMusic)
app_version_and_patches_for(Reddit)
# app_version_and_patches_for(Twitter)
