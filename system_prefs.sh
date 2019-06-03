#!/bin/bash

# Set interval between cursor hitting edge of screen and dock appearing to 0 seconds
# Undo with: defaults delete com.apple.Dock autohide-delay
defaults write com.apple.Dock autohide-delay -float 0

# Set duration of dock reveal animation to 0 seconds
# Undo with: defaults delete com.apple.Dock autohide-time-modifier
defaults write com.apple.Dock autohide-time-modifier -float 0

# Restart Dock to apply changes
killall Dock