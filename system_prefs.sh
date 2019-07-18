#!/bin/bash

##################################################
# System Preferences
##################################################
# Close System Preferences to prevent overriding settings we're about to change
osascript -e 'tell application "System Preferences" to quit'

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing 'sudo' time stamp until '.macos' has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &


##################################################
# General
##################################################
# TODO: Default web browser


##################################################
# Desktop & Screen Saver
##################################################
# TODO: Screen Saver > Star after: 10 Minutes
# Hot Corners > Bottom Left = Put Display to Sleep
defaults write com.apple.dock wvous-bl-corner -int 10
defaults write com.apple.dock wvous-bl-modifier -int 0


##################################################
# Dock
##################################################
# Size
defaults write com.apple.dock tilesize -int 60

# Magnification
defaults write com.apple.dock magnification -bool false

# Automatically hide and show the Dock
defaults write com.apple.dock autohide -bool true

# Automatically hide and show the Dock (delay)
defaults write com.apple.Dock autohide-delay -float 0

# Automatically hide and show the Dock (duration)
defaults write com.apple.Dock autohide-time-modifier -float 0

# Show recent applications in Dock
defaults write com.apple.dock show-recents -bool false

# Make Dock icons of hidden applications translucent
defaults write com.apple.dock showhidden -bool true


##################################################
# Mission Control
##################################################
# Automatically rearrange Spaces based on most recent use
defaults write com.apple.dock mru-spaces -bool false

# Group windows by application
defaults write com.apple.dock expose-group-apps -bool true


##################################################
# Security & Privacy
##################################################
# TODO: Require password immediately, Allow apps downloaded from identified developers
# General > Require password 'immediately' after sleep or screen saver begins (NEED TO VERIFY THIS!)
defaults write com.apple.screensaver askForPassword -int 1
defaults write com.apple.screensaver askForPasswordDelay -int 0

##################################################
# Display
##################################################
# TODO: True Tone (true), Night Shift > Schedule and color temp


##################################################
# Energy Saver
##################################################
# TODO: Battery > Enable power nap


##################################################
# Keyboard
##################################################
# Keyboard > Key Repeat
defaults write NSGlobalDomain KeyRepeat 2

# Keyboard > Delay Until Repeat
defaults write NSGlobalDomain InitialKeyRepeat 15

# Keyboard > Touch Bar shows
defaults write com.apple.touchbar.agent -string "fullControlStrip"

# Text > Replace With Dictionary
defaults write NSGlobalDomain NSUserDictionaryReplacementItems -array

# Text > Correct spelling automatically
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false
defaults write NSGlobalDomain WebAutomaticSpellingCorrectionEnabled -bool false

# Text > Capitalize words automatically
defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false

# Text > Add period with double-space
defaults write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -bool false

# Text > Touch Bar typing suggestions
defaults write NSGlobalDomain NSAutomaticTextCompletionEnabled -bool false

# Text > Use smart quotes and dashes
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false


##################################################
# Trackpad
##################################################
# Point & Click > Click
defaults write com.apple.AppleMultitouchTrackpad FirstClickThreshold -int 0
defaults write com.apple.AppleMultitouchTrackpad SecondClickThreshold -int 0

# More Gestures > App Expose
defaults write com.apple.dock showAppExposeGestureEnabled -bool true


##################################################
# Date & Time
##################################################
Clock > Show date
defaults write com.apple.menuextra.clock DateFormat -string "EEE MMM d  h:mm a"
defaults write com.apple.menuextra.clock FlashDateSeparators -bool false
defaults write com.apple.menuextra.clock IsAnalog -bool false


##################################################
# Finder
##################################################
# General > Show these items on the desktop
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool false
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true

# View > Show Status Bar
defaults write com.apple.finder ShowStatusBar -bool true

# View > Show Path Bar
defaults write com.apple.finder ShowPathbar -bool true


##################################################
# Post-Setup Steps
##################################################
killall cfprefsd
killall Dock
killall Finder
killall SystemUIServer

