#!/bin/bash

# Get the Username of the currently logged user
loggedInUser=`/bin/ls -l /dev/console | /usr/bin/awk '{ print $3 }'`

# Query dscl to get the currently logged in users home folder
loggedInUserHome=`dscl . -read /Users/$loggedInUser | grep NFSHomeDirectory: | /usr/bin/awk '{print $2}'`

# Apply an entourage of Dock icons/settings.
DOCKUTIL=/usr/local/bin/dockutil
defaults write com.apple.dock minimize-to-application -bool YES

sleep 3

$DOCKUTIL --remove all

sleep 3

dockappsarray=('/Applications/Mission Control.app' '/Applications/Launchpad.app' '/Applications/Safari.app' '/Applications/Firefox.app' '/Applications/Cisco Jabber.app' '/Applications/Messages.app' '/Applications/NetExtender.app' '/Applications/Slack.app' '/Applications/Microsoft Outlook.app' '/Applications/Microsoft Excel.app' '/Applications/Microsoft PowerPoint.app' '/Applications/Microsoft Word.app' '/Applications/Microsoft OneNote.app' '/Applications/Microsoft Lync.app' '/Applications/Adobe Acrobat DC/Adobe Acrobat.app' '/Applications/Adobe Acrobat XI Pro/Adobe Acrobat Pro.app' '/Applications/Adobe Acrobat X Pro/Adobe Acrobat Pro.app' '/Applications/Adobe Bridge CC/Adobe Bridge CC.app' '/Applications/Adobe Bridge CS6/Adobe Bridge CS6.app' '/Applications/Adobe Illustrator CC 2015/Adobe Illustrator.app' '/Applications/Adobe Illustrator CS6/Adobe Illustrator.app' '/Applications/Adobe InDesign CC 2015/Adobe InDesign CC 2015.app' '/Applications/Adobe InDesign CS6/Adobe InDesign CS6.app' '/Applications/Adobe Photoshop CC 2015/Adobe Photoshop CC 2015.app' '/Applications/Adobe Photoshop CS6/Adobe Photoshop CS6.app' '/Applications/Adobe Dreamweaver CC 2015/Adobe Dreamweaver CC 2015.app' '/Applications/Adobe Dreamweaver CS6/Adobe Dreamweaver CS6.app' '/Applications/System Preferences.app' )

for element in "${dockappsarray[@]}"; do
	if [ -e "$element" ]; then
		$DOCKUTIL --add "$element"
	fi
done

$DOCKUTIL --add ~/Documents --position end 

$DOCKUTIL --add ~/Downloads --position end 

# Restart the Dock after applying settings.
#killall Dock

sleep 3

########################
# Normal Finder settings
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool YES

defaults write com.apple.finder ShowHardDrivesOnDesktop -bool YES

defaults write com.apple.finder ShowMountedServersOnDesktop -bool YES

defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool YES

defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

# Enable AirDrop over Ethernet and on unsupported Macs running Lion
defaults write com.apple.NetworkBrowser BrowseAllInterfaces -bool true

# Default to list view in Finder windows (others: `icnv`, `clmv`, `Flwv`)
defaults write com.apple.finder FXPreferredViewStyle -string "clmv"

# Automatically quit printer app once the print jobs complete
defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true

# Save to disk (not to iCloud) by default
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

# Expand save panel by default
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true

# Expand print panel by default
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true

# Allow text selection in Quick Look
defaults write com.apple.finder QLEnableTextSelection -bool true

# Open new windows on the user's home
defaults write com.apple.finder NewWindowTarget -string "PfHm"
defaults write com.apple.finder NewWindowTargetPath -string "file://$HOME"
########################

# Desktop View Settings
# Make sure the DesktopViewSettings dictionary exists
/usr/libexec/PlistBuddy -c "Add :DesktopViewSettings dict" "$loggedInUserHome"/Library/Preferences/com.apple.finder.plist

# Make sure the IconViewSettings dictionary exists
/usr/libexec/PlistBuddy -c "Add :DesktopViewSettings:IconViewSettings dict" "$loggedInUserHome"/Library/Preferences/com.apple.finder.plist

/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:arrangeBy 'grid'" "$loggedInUserHome"/Library/Preferences/com.apple.finder.plist

sleep 1

# Restart Finder after applying settings.
killall Finder

sleep 3

# Mouse settings (Not working until after reboot)
defaults write com.apple.driver.AppleBluetoothMultitouch.mouse MouseButtonMode "TwoButton"

# Built-In Trackpad settings (Not working until after reboot)
defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerDrag -bool YES

defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerHorizSwipeGesture -int 0

defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerVertSwipeGesture -int 0

defaults write com.apple.AppleMultitouchTrackpad Clicking -bool YES

defaults write com.apple.AppleMultitouchTrackpad TrackpadFiveFingerPinchGesture -int 2

defaults write com.apple.AppleMultitouchTrackpad TrackpadFourFingerHorizSwipeGesture -int 2

defaults write com.apple.AppleMultitouchTrackpad TrackpadFourFingerPinchGesture -int 2

defaults write com.apple.AppleMultitouchTrackpad TrackpadFourFingerVertSwipeGesture -int 2

# Bluetooth Trackpad settings (Not working until after reboot)
defaults write com.apple.driver.AppleMultitouchTrackpad TrackpadThreeFingerDrag -bool YES

defaults write com.apple.driver.AppleMultitouchTrackpad TrackpadThreeFingerHorizSwipeGesture -int 0

defaults write com.apple.driver.AppleMultitouchTrackpad TrackpadThreeFingerVertSwipeGesture -int 0

defaults write com.apple.driver.AppleMultitouchTrackpad Clicking -bool YES

defaults write com.apple.driver.AppleMultitouchTrackpad TrackpadFiveFingerPinchGesture -int 2

defaults write com.apple.driver.AppleMultitouchTrackpad TrackpadFourFingerHorizSwipeGesture -int 2

defaults write com.apple.driver.AppleMultitouchTrackpad TrackpadFourFingerPinchGesture -int 2

defaults write com.apple.driver.AppleMultitouchTrackpad TrackpadFourFingerVertSwipeGesture -int 2

# Wallpaper
osascript -e "tell application \"System Events\" to set picture of every desktop to \"/usr/local/bmlg_assets/bmlg_wallpaper.jpg\""

# Kill cfprefsd so that the manual plist modifications will stick.
killall cfprefsd
