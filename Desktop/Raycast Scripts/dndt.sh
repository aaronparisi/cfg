#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title dndt
# @raycast.mode silent

# Optional parameters:
# @raycast.icon 🤖

# Documentation:
# @raycast.description toggles do not disturb

osascript -e 'tell application "System Events" to keystroke "d" using {shift down, command down, control down, option down}'

