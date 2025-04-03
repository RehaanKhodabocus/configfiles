#!/bin/bash

# Ask for the password once at the beginning
echo "Please enter your admin password:"
read -s password
echo

# Keep sudo session alive throughout the script
echo "$password" | sudo -S -v
# Keep sudo session alive in the background
(while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &)

echo "Updating Homebrew"
brew update

# Installing applications
echo "Installing Applications"
echo "Installing Zen Browser"
brew install --cask zen

echo "Installing Whatsapp"
brew install --cask whatsapp

echo "Installing Obsidian"
brew install --cask obsidian

echo "Installing Free Download Manager"
brew install --cask free-download-manager

echo "Installing Ghostty"
brew install --cask ghostty

echo "Installing Discord"
brew install --cask discord

echo "Installing Mounty"
brew install --cask macfuse
brew install gromgit/fuse/ntfs-3g-mac
brew install --cask mounty

echo "Installing IINA"
brew install --cask iina

echo "Installing MesloLG Nerd Font"
brew install --cask font-meslo-lg-nerd-font

echo "Installing The Unarchiver"
brew install --cask the-unarchiver

echo "Installing OBS"
brew install --cask obs

echo "All applications have been installed."


# Changing Computer Settings
echo "Changing Mac Settings"

echo "Changing Dock Settings"
# Sets dock size
# Sets hiding on 
# Sets instant opening of dock on mouse hover
# Sets show recents to false
# Sets minimize effects to genie effect
# Show only active apps

defaults write com.apple.dock "tilesize" -int "30"
defaults write com.apple.dock "autohide" -bool "true"
defaults write com.apple.dock "autohide-delay" -float "0"
defaults write com.apple.dock "show-recents" -bool "false"
defaults write com.apple.dock "mineffect" -string "genie"

echo "Changing Finder Settings"
# Do not show file extentions
# Show Path Bar 
# Show Status Bar
# Sets Finder to List View
# Keep all Folders on top
# Sets Search Scope to Search entire Mac
# Display Warning before changing a File Extentions
# Display Icons on Title Bar
# Remove Hover Delay on Icon on Title Bar
# Sets Icon Size in SideBar of Finder
# Removes Recent Tags in Sidebar
defaults write NSGlobalDomain "AppleShowAllExtensions" -bool "false"
defaults write com.apple.finder "ShowPathbar" -bool "true"
defaults write com.apple.finder ShowStatusBar -int 1
defaults write com.apple.finder "FXPreferredViewStyle" -string "Nlsv"
defaults write com.apple.finder "_FXSortFoldersFirst" -bool "true"
defaults write com.apple.finder "FXDefaultSearchScope" -string "SCev"
defaults write com.apple.finder "FXEnableExtensionChangeWarning" -bool "true"
defaults write com.apple.universalaccess "showWindowTitlebarIcons" -bool "true"
defaults write NSGlobalDomain "NSToolbarTitleViewRolloverDelay" -float "0"
defaults write NSGlobalDomain "NSTableViewDefaultSizeMode" -int "2"	
defaults write com.apple.Finder ShowRecentTags -bool false


echo "Changing Desktop Settings"
# Keeping all Folders at the Top
# Show all Icons on Desktop
# Show Hard Disks on Desktop
# Show External Disks on Desktop

defaults write com.apple.finder "_FXSortFoldersFirstOnDesktop" -bool "true"
defaults write com.apple.finder "CreateDesktop" -bool "true"
defaults write com.apple.finder "ShowHardDrivesOnDesktop" -bool "true"
defaults write com.apple.finder "ShowExternalHardDrivesOnDesktop" -bool "true"

echo "Changing Menu Bar Settings"
# Sets a time separator that flashes every seconds
# Sets the date and time format
# Enables Mouse Acceleration
# Sets the mouse movement
# When a new disk is plug in, do not ask to use it as Time Machine

defaults write com.apple.menuextra.clock "FlashDateSeparators" -bool "true"
defaults write com.apple.menuextra.clock "DateFormat" -string "\"EEE d MMM HH:mm\""
defaults write NSGlobalDomain com.apple.mouse.linear -bool "false"
defaults write NSGlobalDomain com.apple.mouse.scaling -float "3"
defaults write com.apple.TimeMachine "DoNotOfferNewDisksForBackup" -bool "false"

# Kills/Restarts apps to make changes effective
echo "Restarting Finder and Dock"
killall Finder
killall Dock

printf '\u2728\e[1;33m Installation completed! \u2728 \e[m\n'
read -r -p "Press any key to reboot your computer...: "

# Use the stored password for reboot
echo "$password" | sudo -S reboot
