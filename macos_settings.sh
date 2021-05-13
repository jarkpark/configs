#!/usr/bin/env bash

echo "Beginning macOS Big Sur settings configuration..."

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
# Appearance (one of: Light, Dark, Auto)
# Light
# do nothing
# Dark
# defaults write NSGlobalDomain AppleInterfaceStyle -string "Dark"
# Auto
# defaults write NSGlobalDomain AppleInterfaceStyleSwitchesAutomatically -bool true

# Show scroll bars (Always)
defaults write NSGlobalDomain AppleShowScrollBars -string "Always"

# Click in the scroll bar to (Jump to the spot that's clicked)
defaults write NSGlobalDomain AppleScrollerPagingBehavior -bool true

# Default web browser (set when opening Chrome)
echo "Manually set default browser when opening Chrome"

# Close windows when quitting an app (unchecked)
defaults write NSGlobalDomain NSQuitAlwaysKeepsWindows -bool true


##################################################
# Dock & Menu Bar
##################################################
# Dock & Menu Bar > Size
defaults write com.apple.dock tilesize -int 60

# Dock & Menu Bar > Magnification (unchecked)
defaults write com.apple.dock magnification -bool false

# Dock & Menu Bar > Automatically hide and show the Dock (checked)
defaults write com.apple.dock autohide -bool true

# Dock & Menu Bar > Show recent applications in Dock (unchecked)
defaults write com.apple.dock show-recents -bool false

# Automatically hide and show the Dock (delay)
defaults write com.apple.Dock autohide-delay -float 0.25

# Automatically hide and show the Dock (duration)
defaults write com.apple.Dock autohide-time-modifier -float 0

# Make Dock icons of hidden applications translucent
defaults write com.apple.dock showhidden -bool true

# Battery
echo "Manually set System Preferences > Dock & Menu Bar > 'Show in Menu Bar' and 'Show Percentage'"

# Clock > Date Options > Show the day of the week (checked)
defaults write com.apple.menuextra.clock ShowDayOfWeek -bool true

# Clock > Date Options > Show date (checked)
defaults write com.apple.menuextra.clock ShowDayOfMonth -bool true

# Clock > Time Options > Digital
defaults write com.apple.menuextra.clock IsAnalog -bool false

# Clock > Time Options > Use a 24-hour clock (unchecked)
defaults write com.apple.menuextra.clock Show24Hour -bool false

# Clock > Time Options > Show AM/PM (checked)
defaults write com.apple.menuextra.clock ShowAMPM -bool true

# Clock > Time Options > Flash the time separators (unchecked)
defaults write com.apple.menuextra.clock FlashDateSeparators -bool false

# Clock > Time Options > Display the time with seconds (unchecked)
defaults write com.apple.menuextra.clock ShowSeconds -bool false

# Clock (This should be set automatically)
# defaults write com.apple.menuextra.clock DateFormat -string "EEE MMM d  h:mm a"


##################################################
# Mission Control
##################################################
# Automatically rearrange Spaces based on most recent use (unchecked)
defaults write com.apple.dock mru-spaces -bool false

# Group windows by application (checked)
defaults write com.apple.dock expose-group-apps -bool true


##################################################
# Siri
##################################################
# Show Siri in menu bar (unchecked)
defaults write com.apple.Siri StatusMenuVisible -bool false


##################################################
# Security & Privacy
##################################################
echo "Manually set System Preferences > Security & Privacy"
echo "**Security & Privacy -> Privacy -> Full Disk Access + iTerm"


##################################################
# Displays
##################################################
# True Tone (true), Night Shift > Schedule and color temp
echo "Manually set System Preferences > Displays > Night Shift (and True Tone)"


##################################################
# Keyboard
##################################################
# Keyboard > Key Repeat (fastest)
defaults write NSGlobalDomain KeyRepeat -int 2

# Keyboard > Delay Until Repeat (shortest)
defaults write NSGlobalDomain InitialKeyRepeat -int 15

# Keyboard > Touch Bar shows
# TODO: uncomment me for touchbar enabled macs
#defaults write com.apple.touchbar.agent -string "fullControlStrip"

# Text > Replace With Dictionary (clears by writing empty array)
defaults write NSGlobalDomain NSUserDictionaryReplacementItems -array

# Text > Correct spelling automatically (unchecked)
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false
defaults write NSGlobalDomain WebAutomaticSpellingCorrectionEnabled -bool false

# Text > Capitalize words automatically (unchecked)
defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false

# Text > Add period with double-space (unchecked)
defaults write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -bool false

# Text > Touch Bar typing suggestions
# TODO: uncomment me for touchbar enabled macs
#defaults write NSGlobalDomain NSAutomaticTextCompletionEnabled -bool false

# Text > Use smart quotes and dashes (unchecked)
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false

# Shortcuts > Use keyboard navigation to move focus/Press the Tab key (checked)
defaults write NSGlobalDomain AppleKeyboardUIMode -int 2

# Shortcuts > Services
echo "Manually uncheck System Preferences > Keyboard > Shortcuts > Launchpad > Turn Dock Hiding On/Off"
echo "Manually uncheck System Preferences > Keyboard > Shortcuts > Mission Control > Mission Control"
echo "Manually uncheck System Preferences > Keyboard > Shortcuts > Mission Control > Application windows"
echo "Manually uncheck System Preferences > Keyboard > Shortcuts > Services > Search man Page Index in Terminal"

# Dictation > Shortcut (Off)
defaults write com.apple.HIToolbox AppleDictationAutoEnable -int 0

# Enable Press & Hold for Key Repeat (Disable accents popup)
defaults write -g ApplePressAndHoldEnabled -bool false


##################################################
# Trackpad
##################################################
# Point & Click > Click (Light)
defaults write com.apple.AppleMultitouchTrackpad FirstClickThreshold -int 0
defaults write com.apple.AppleMultitouchTrackpad SecondClickThreshold -int 0

# More Gestures > App Expose (checked)
defaults write com.apple.dock showAppExposeGestureEnabled -bool true

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
# Preferences > General > Show these items on the desktop > Hard disks (unchecked)
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool false

# Preferences > General > Show these items on the desktop > External disks (checked)
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true

# Preferences > General > Show these items on the desktop > CDs, DVDs, and iPods (checked)
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true

# Preferences > General > New Finder windows show (Applications)
defaults write com.apple.finder NewWindowTarget -string "PfLo"
defaults write com.apple.finder NewWindowTargetPath -string "file:///Applications/"

# Preferences > Sidebar
echo "Manually set Finder > Preferences > Sidebar"

# Preferences > Advanced > Show all filename extensions (checked)
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Preferences > Advanced > When performing a search (Search the Current Folder)
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

# View > as List (checked)
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"
defaults write com.apple.finder SearchRecentsSavedViewStyle -string "Nlsv"

# View > Show Status Bar (checked)
defaults write com.apple.finder ShowStatusBar -bool true

# View > Show Path Bar (checked)
# commented out because POSIX path is enabled below
#defaults write com.apple.finder ShowPathbar -bool true

# Display full POSIX path as Finder window title
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true


##################################################
# Messages
##################################################
# Edit > Spelling and Grammar > Correct Spelling Automatically (unchecked)
defaults write com.apple.messages.text Autocorrection -int 1

# Edit > Spelling and Grammar > Check Spelling While Typing (unchecked)
defaults write com.apple.messages.text SpellChecking -int 1

# Edit > Spelling and Grammar > Capitalize Sentences Automatically (unchecked)
defaults delete com.apple.messages.text Autocapitalization

# Edit > Substitutions > Smart Quotes (unchecked)
defaults write com.apple.messages.text SmartQuotes -int 1

# Edit > Substitutions > Smart Dashes (unchecked)
defaults write com.apple.messages.text SmartDashes -int 1

# Edit > Substitutions > Smart Insert/Delete (unchecked)
defaults write com.apple.messages.text SmartInsertDelete -int 1

# Edit > Substitutions > Emoji Replacement (unchecked)
defaults write com.apple.messages.text EmojiReplacement -int 1


##################################################
# Post-Configuration Steps
##################################################
killall cfprefsd
killall Dock
killall Finder
killall Messages
killall SystemUIServer

echo "Done configuring macOS Big Sur settings. Restart machine."
