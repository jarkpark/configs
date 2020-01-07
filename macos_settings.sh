#!/usr/bin/env bash

echo "Beginning macOS settings configuration..."

##################################################
# Begin System Preferences Configuration
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
# Show scroll bars: Always
defaults write NSGlobalDomain AppleShowScrollBars -string "Always"

# Default web browser: set when opening Chrome
echo "Manually set default browser when opening Chrome!"


##################################################
# Desktop & Screen Saver
##################################################
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
echo "Manually set System Preferences > Security & Privacy!"


##################################################
# Display
##################################################
# True Tone (true), Night Shift > Schedule and color temp
echo "Manually set System Preferences > Displays > Night Shift (and True Tone)"


##################################################
# Energy
##################################################
# Show Battery Percentage in Menu Bar
defaults write com.apple.menuextra.battery ShowPercent -string "YES"


##################################################
# Keyboard
##################################################
# Keyboard > Key Repeat
defaults write NSGlobalDomain KeyRepeat -int 2

# Keyboard > Delay Until Repeat
defaults write NSGlobalDomain InitialKeyRepeat -int 15

# Keyboard > Touch Bar shows
# TODO: uncomment me for touchbar enabled macs!
#defaults write com.apple.touchbar.agent -string "fullControlStrip"

# Keyboard > Modifier Keys...
echo "Manually set System Preferences > Keyboard > Modifier Keys > Caps Lock -> Control (and other Modifier Keys)!"

# Text > Replace With Dictionary (clears by writing empty array)
defaults write NSGlobalDomain NSUserDictionaryReplacementItems -array

# Text > Correct spelling automatically
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false
defaults write NSGlobalDomain WebAutomaticSpellingCorrectionEnabled -bool false

# Text > Capitalize words automatically
defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false

# Text > Add period with double-space
defaults write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -bool false

# Text > Touch Bar typing suggestions
# TODO: uncomment me for touchbar enabled macs!
#defaults write NSGlobalDomain NSAutomaticTextCompletionEnabled -bool false

# Text > Use smart quotes and dashes
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false

# Shortcuts > Full Keyboard Access (Tab between modal buttons)
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

# Shortcuts > Services
echo "Manually uncheck System Preferences > Keyboard > Shortcuts > Services > Search man Page Index in Terminal!"

# Enable Press & Hold for Key Repeat (Disable accents popup)
defaults write -g ApplePressAndHoldEnabled -bool false

##################################################
# Trackpad
##################################################
# Point & Click > Click (Light force)
defaults write com.apple.AppleMultitouchTrackpad FirstClickThreshold -int 0
defaults write com.apple.AppleMultitouchTrackpad SecondClickThreshold -int 0

# More Gestures > App Expose
defaults write com.apple.dock showAppExposeGestureEnabled -bool true


##################################################
# Sound
##################################################
# Sound Effects > Show volume in menu bar
defaults write com.apple.systemuiserver "NSStatusItem Visible com.apple.menuextra.volume" -int 1
defaults write com.apple.systemuiserver menuExtras -array-add "/System/Library/CoreServices/Menu Extras/Volume.menu"


##################################################
# Date & Time
##################################################
# Clock > Show date
defaults write com.apple.menuextra.clock DateFormat -string "EEE MMM d  h:mm a"
defaults write com.apple.menuextra.clock FlashDateSeparators -bool false
defaults write com.apple.menuextra.clock IsAnalog -bool false
##################################################
# End System Preferences Configuration
##################################################


##################################################
# Contacts
##################################################
# Preferences > General > Prefer nicknames
echo "Manually set Contacts > Preferences > General > Prefer nicknames"


##################################################
# Finder
##################################################
# Preferences > General > Show these items on the desktop
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool false
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true

# Preferences > General > New Finder windows show: Applications
defaults write com.apple.finder NewWindowTarget -string "PfLo"
defaults write com.apple.finder NewWindowTargetPath -string "file:///Applications/"

# Preferences > Sidebar
echo "Manually set Finder > Preferences > Sidebar!"

# Preferences > Advanced > Show all filename extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Preferences > Advanced > When performing a search: Search the Current Folder
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

# View > as List for all Finder windows by default
echo "Manually set Finder > View > as List!"

# View > Show Status Bar
defaults write com.apple.finder ShowStatusBar -bool true

# View > Show Path Bar
# commented out because POSIX path is enabled below
#defaults write com.apple.finder ShowPathbar -bool true

# Display full POSIX path as Finder window title
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true


##################################################
# Messages
##################################################
# Edit > Substitutions > Text Replacement > Emoji
defaults write com.apple.iChat.inputLine inputLineSettingsKey -dict-add "automaticEmojiSubstitutionEnabled" -bool false
defaults write com.apple.iChat.inputLine inputLineSettingsKey -dict-add "automaticTextReplacementEnabled" -bool false

# Edit > Substitutions > Smart Quotes
defaults write com.apple.iChat.inputLine inputLineSettingsKey -dict-add "automaticQuoteSubstitutionEnabled" -bool false

# Edit > Spelling and Grammar > Correct Spelling Automatically
defaults write com.apple.iChat.inputLine inputLineSettingsKey -dict-add "automaticSpellingCorrectionEnabled" -bool false


##################################################
# Post-Configuration Steps
##################################################
killall cfprefsd
killall Dock
killall Finder
killall Messages
killall SystemUIServer

echo "Done configuring macOS settings. Restart machine."
