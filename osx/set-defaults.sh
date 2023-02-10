# Sets reasonable OS X defaults.
#
# Or, in other words, set shit how I like in OS X.
#
# The original idea (and a couple settings) were grabbed from:
#   https://github.com/mathiasbynens/dotfiles/blob/master/.osx
#
# Run ./set-defaults.sh and you'll be good to go.

# Disable press-and-hold for keys in favor of key repeat.
#defaults write -g ApplePressAndHoldEnabled -bool false

# Use AirDrop over every interface. srsly this should be a default.
#defaults write com.apple.NetworkBrowser BrowseAllInterfaces 1

# Always open everything in Finder's list view.
# To ensure that it is all set, we need to remove all the ".DS_Store" files
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"
sudo find ~/ -name ".DS_Store" -exec rm {} \;

# Always show the filename extensions in Finder
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Show the Path and Status Bar in Finder
defaults write com.apple.Finder ShowPathbar -bool true
defaults write com.apple.Finder ShowStatusBar -bool true

# Show the ~/Library folder.
chflags nohidden ~/Library

# Set a really fast key repeat.
#defaults write NSGlobalDomain KeyRepeat -int 0

# Set the Finder prefs for showing a few different volumes on the Desktop.
#defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true
#defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true

# Run the screensaver if we're in the bottom-left hot corner.
#defaults write com.apple.dock wvous-bl-corner -int 5
#defaults write com.apple.dock wvous-bl-modifier -int 0

# Hide Safari's bookmark bar.
#defaults write com.apple.Safari ShowFavoritesBar -bool false

# Set up Safari for development.
#defaults write com.apple.Safari IncludeInternalDebugMenu -bool true
#defaults write com.apple.Safari IncludeDevelopMenu -bool true
#defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
#defaults write com.apple.Safari "com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled" -bool true
#defaults write NSGlobalDomain WebKitDeveloperExtras -bool true

# Show attachments as icons in Mail
defaults write com.apple.mail DisableInlineAttachmentViewing -bool yes

# Expanded Save Dialog as Default (TRUE) and not the other (FALSE):
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true

# UI customization
defaults write NSGlobalDomain AppleInterfaceStyle Dark

# Dock Settings
defaults write com.apple.dock tilesize -int 50
defaults write com.apple.dock largesize -float 95
defaults write com.apple.dock magnification -bool true
defaults write com.apple.dock autohide -bool true

# set bottom right hot corner to lock screen
defaults write com.apple.dock wvous-br-corner -int 13

# Stop dash / dot substitution
defaults write 'Apple Global Domain' NSAutomaticDashSubstitutionEnabled 0

# configure keyboard and trackpad
defaults write com.apple.AppleMultitouchTrackpad Clicking -bool true
sudo defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
sudo defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
sudo defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

# After all the configuration, reboot the finder
sudo killall Finder
sudo killall Dock
