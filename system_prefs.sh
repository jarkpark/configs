#!/bin/bash


# System Preferences
# Close System Preferences to prevent overriding settings we’re about to change
osascript -e 'tell application "System Preferences" to quit'


# General
# TODO: Default web browser


# Desktop & Screen Saver
# TODO: Screen Saver > Star after: 10 Minutes
# Hot Corners > Bottom Left = Put Display to Sleep
defaults write com.apple.dock wvous-bl-corner -int 10
defaults write com.apple.dock wvous-bl-modifier -int 0


# Dock
# Size:
defaults write com.apple.dock tilesize -int 60

# Magnification:
defaults write com.apple.dock magnification -bool false

# Automatically hide and show the Dock:
defaults write com.apple.dock autohide -bool true

# Automatically hide and show the Dock (delay):
# Undo with: defaults delete com.apple.Dock autohide-delay
defaults write com.apple.Dock autohide-delay -float 0

# Automatically hide and show the Dock (duration):
# Undo with: defaults delete com.apple.Dock autohide-time-modifier
defaults write com.apple.Dock autohide-time-modifier -float 0

# Restart Dock to apply changes
killall Dock


# Mission Control
# Automatically rearrange Spaces based on most recent use
defaults write com.apple.dock mru-spaces -bool false

# Group windows by application
defaults write com.apple.dock expose-group-apps -bool true


# Security & Privacy
# TODO: Require password immediately, Allow apps downloaded from identified developers


# Display
# TODO: True Tone (true), Night Shift > Schedule and color temp


# Energy Saver
# TODO: Battery > Enable power nap


# Keyboard
# TODO: Text > disable spell correction
# Keyboard > Key Repeat
defaults write NSGlobalDomain KeyRepeat 2

# Keyboard > Delay Until Repeat
defaults write NSGlobalDomain InitialKeyRepeat 15

# Text > Clear Text Replacements
#defaults write NSGlobalDomain NSUserDictionaryReplacementItems () ?

# Text > Correct spelling automatically
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false
defaults write NSGlobalDomain WebAutomaticSpellingCorrectionEnabled -bool false

# Text > Capitalize words automatically
defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false

# Text > Add period with double-space
defaults write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -bool false

# Text > Touch Bar typing suggestions


# Trackpad
# Point & Click > Click
defaults write com.apple.AppleMultitouchTrackpad FirstClickThreshold -int 0
defaults write com.apple.AppleMultitouchTrackpad SecondClickThreshold -int 0

# More Gestures > App Expose
defaults write com.apple.dock showAppExposeGestureEnabled -bool true


# Date & Time
Clock > Show date
defaults write com.apple.menuextra.clock DateFormat -string "EEE MMM d  h:mm a"
defaults write com.apple.menuextra.clock FlashDateSeparators -bool false
defaults write com.apple.menuextra.clock IsAnalog -bool false

