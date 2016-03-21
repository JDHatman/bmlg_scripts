#!/bin/bash

###################################################################
################## Copy User Data Script ##########################
##################     Jason Hatman      ##########################
###################################################################

# All portions of the script that start with a # sign represent
# notes that I've added in to help explain what is happening. If
# you want a useful view of how the script works, I recommend
# using Notepad++ for Windows or TextWrangler for Mac to view it.

# Start off by clearing the terminal window so we start off fresh.
clear

# Show a disclaimer.
echo -e "\nDisclaimer...\n\nThis script is designed to be executed by a tech, not an end user.\n"
read -p "Would you like to continue?(y/n)" continueyesno
if [ $continueyesno == "n" ];then
	echo -e "\nOk.  Exiting......."
	sleep 2
	osascript -e 'tell application "Terminal" to close (every window whose name contains "copy_user_data")' &
	exit
fi

#####################################################################
## Check to see if the data to be trasnferred is coming from       ##
## another computer or from another account on the same computer.  ##
#####################################################################

# Display a list of options to choose from. Then take the option that 
# is selected and turn it into a new variable called "sourceresult".
sourceoptions=("Another_computer An_old_user_account_on_this_computer")
clear
echo -e "\nWhere is the user's data coming from? Select a number (1 or 2)"
select source in $sourceoptions; do
  sourceresult="$source"
  break
done

#####################################################################
## This next part is important. There are 2 versions of the        ##
## script. Only one version will be executed.  Based on the choice ##
## the user made, either the script starting 5 lines down will run ##
## or the script starting 200 lines down will run.                 ##
#####################################################################

if [ $sourceresult == "Another_computer" ]; then

echo -e "\nOk, great. We're going to copy data from an old machine."
echo -e "Please make sure that the old machine stays on the network\nfor the duration of this copy process."
read -p "Press any key to continue..."

# Make sure that the user is logged in, not the admin account.
clear
echo -e "\nMake sure you are logged in as the user, not the admin account."
read -p "Are you logged in as the user?(y/n)" userloggedinprompt

if [ $userloggedinprompt != "y" ];then
  echo -e "\nSorry, you must be logged in as the user.  Exiting......."
  exit 0
fi

# Mount point no longer needed since we will be using ssh over rsync.
# Create a mount point for the old mac. This is the same as making a new folder.
# The below few line makes sure that there isn't already a folder named "oldmac"
# residing in the /Volumes directory.
# if [ -e /Volumes/oldmac ]; then
#   diskutil unmount /Volumes/oldmac &>/dev/null
#   if [ -e /Volumes/oldmac ]; then
#     rm -rf /Volumes/oldmac &>/dev/null
#   fi
# fi

# echo -e "\nCreating a mount point for the old Mac..."
# mkdir /Volumes/oldmac
# echo -e "Mount point created.\n"

# Prompt for IP address to old Mac.
clear
read -p "What is the IP address of the user's old Mac?" ipaddress

# Get the current logged in user.
loggedinuser=`ps aux 2> /dev/null | grep [l]oginwindow | cut -d " " -f1`
loggedinuserlong=`defaults read /Library/Preferences/com.apple.RemoteDesktop Text1`

# Check to see if the username currently logged in matches what the user logged 
# in with on their old computer. If not, ask them what the old username was.
# Whichever they choose, store that in a new variable called "oldusernameresult".
clear
echo -e "\nThe user's ID on this Mac is $loggedinuser."
read -p "Is this the same as the user's ID on the old Mac?(y/n)" sameuserresponse
if [ $sameuserresponse != "y" ]; then
  read -p "Ok, then what username did they use to log into the old Mac?" oldusernameresponse
  oldusername=$oldusernameresponse
  echo "Got it, thanks."
else
  oldusername=$loggedinuser
  echo "Good, keeps things easy."
fi
read -p "Press any key to continue..."

# Mount the user folder of the old Mac and show the contents. I have it set to 
# prompt for the username and password. This way no user passwords have to be 
# stored in this script.
# echo -e "\nMounting the user folder from the old Mac..."
# echo -e "You will be prompted for the user's username and password.\nIf you entered a different username in the previous step\nbe sure to use it instead of their AD username."
# mount_afp -i afp://"$ipaddress"/"$oldusername" /Volumes/oldmac
# echo -e "\nMount successful"
# echo "Here are the contents of the mounted folder:"
# ls /Volumes/oldmac

# Figure out what the boot volume is called on the old and new Macs.
# echo -e "\n\nWe need to gather some information from the old computer. If you prompted about the RSA key, please type 'yes' to continue.\n\nYou will then be prompted to enter the password for the admin account.\n"
# oldbootvolume=`ssh bmlgitadmin@$ipaddress 'diskutil info / | grep "Volume Name" | awk -F " {2,}" '\''{ print $3 }'\'''`
# newbootvolume=`diskutil info / | grep "Volume Name" | awk -F " {2,}" '{ print $3 }'`

# Get the location of the home folder on the new computer.
newhomelocal=`cd ~;pwd`

# Generate rsa keys and copy them to the remote computer.  This allows the rest of the script to work without having to enter a password.
clear
echo -e "\nYou will now be prompted to enter the password for the old computer a maximum of two times.  Afterwards you should not be prompted for the password again.\n\n"
read -p "Press any key to continue..."
mkdir $newhomelocal/.ssh
if [[ -e $newhomelocal/.ssh/id_rsa ]]; then
	echo ""
else
	ssh-keygen -t rsa -f $newhomelocal/.ssh/id_rsa -P ""
fi
clear
echo -e "Please enter the password for the old computer..."
ssh $oldusername@$ipaddress mkdir -p .ssh
echo -e "One more time..."
cat $newhomelocal/.ssh/id_rsa.pub | ssh $oldusername@$ipaddress 'cat >> .ssh/authorized_keys'

# Get the location of the user's home folder on the old computer.
oldhomelocal=`ssh $oldusername@$ipaddress 'pwd'`

# Get the size of the user's old home folder
clear
echo -e "\nCalculating size of data to be copied..."
#oldhomefoldersize=`ssh $oldusername@$ipaddress 'du -s -I Library -I "Microsoft User Data" -I ".Trash" ~ | awk '\''{ print $1 }'\'''`
oldhomefoldersize=`rsync -ae ssh --info=progress2 --recursive --links --group --owner --perms --times --update --dry-run --exclude 'Library' --exclude 'Microsoft User Data' $oldusername@$ipaddress:~ $newhomelocal | awk '{print $2}' | sed 's/,//g'`

#oldhomefoldersize2=`echo "$(($oldhomefoldersize * 512))"`
#echo $oldhomefoldersize2
#read -p "Press any key to continue..."

# Get the size of the new Mac's hard drive, multiplied by 80%.
# We want to make sure that we won't be taking up more than
# 80% of the space on the new hard drive.
newhdspace=`df / | awk '{ print $4 }' | sed -n '2 p'`
newhdspace=$(( $newhdspace * 512 ))
newhdspace2=`echo "(($newhdspace * .80)+0.5)/1" | bc`

# Compare the two sizes and make a decision.
if [ $oldhomefoldersize -gt $newhdspace ]; then
  echo -e "\nWarning!!!!!"
  echo -e "\nThere is not enough space on this hard drive to copy all of the user's old data.\nLog in as the old account and either delete some data \nor move it to an external drive.\n"
  read -p "We cannot continue.  Press any key to exit..."
  exit 0
elif [ $oldhomefoldersize -gt $newhdspace2 ]; then
  echo -e "\nWarning!!!!!"
  echo -e "\nCopying over this user's data will use over 80% of the new hard drive's space.\nI strongly recommend that you stop and ask the user to either delete some data \nor move it to an external drive.\n"
  read -p "Would you like to continue? (not recommended) (y/n)" spacewarnresponse
  if [ $spacewarnresponse == "n" ]; then
    echo -e "\nPlease try again after the user has reduced the size of their old home folder.\nExiting....."
    exit 0
  fi
fi

# Tell user to go chill
clear
echo -e "\nAbout to start the copy process.\n"
read -p "What is your email address?" emailaddress
if [ $oldhomefoldersize -gt 11000000 ]; then
  echo -e "\nThere is more than 5GB of data to copy.\nGo relax. This might take a while.\nYou will receive an email summary when it's finished.\n"
  read -p "Press any key to continue..."
else
  echo -e "\nThere is less than 5GB of data to copy.\nSit tight, it shouldn't take long.\nYou will also receive an email summary when it's finished.\n"
  read -p "Press any key to continue..."
fi

# Copy each folder
# Desktop
clear
echo -e "\nCopying Desktop..."
#desktopsizechunk=`ssh $oldusername@$ipaddress 'du -s $oldhomelocal/Desktop | awk '\''{ print $1 }'\'''`
#desktopsize=`echo "$(($desktopsizechunk * 512))"`
#rsync --recursive --links --group --owner --perms --times --update /Volumes/oldmac/Desktop/ /Users/$loggedinuser/Desktop
rsync -ae ssh --info=progress2 --recursive --links --group --owner --perms --times --update $oldusername@$ipaddress:$oldhomelocal/Desktop/ $newhomelocal/Desktop
echo "Desktop copy finished."
newdesktopsize=`du -s $newhomelocal/Desktop | awk '{ print $1 }'`
sleep 1

# Documents
echo -e "\nCopying Documents..."
#rsync --recursive --links --group --owner --perms --times --update --exclude 'Microsoft User Data' /Volumes/oldmac/Documents/ /Users/$loggedinuser/Documents
rsync -ae ssh --info=progress2 --recursive --links --group --owner --perms --times --update --exclude 'Microsoft User Data' $oldusername@$ipaddress:$oldhomelocal/Documents/ $newhomelocal/Documents
echo "Documents copy finished."
newdocumentssize=`du -s $newhomelocal/Documents | awk '{ print $1 }'`
sleep 1

# Downloads
echo -e "\nCopying Downloads..."
#rsync --recursive --links --group --owner --perms --times --update /Volumes/oldmac/Downloads/ /Users/$loggedinuser/Downloads
rsync -ae ssh --info=progress2 --recursive --links --group --owner --perms --times --update $oldusername@$ipaddress:$oldhomelocal/Downloads/ $newhomelocal/Downloads
echo "Downloads copy finished."
newdownloadssize=`du -s $newhomelocal/Downloads | awk '{ print $1 }'`
sleep 1

# Movies
echo -e "\nCopying Movies..."
#rsync --recursive --links --group --owner --perms --times --update /Volumes/oldmac/Movies/ /Users/$loggedinuser/Movies
rsync -ae ssh --info=progress2 --recursive --links --group --owner --perms --times --update $oldusername@$ipaddress:$oldhomelocal/Movies/ $newhomelocal/Movies
echo "Movies copy finished."
newmoviessize=`du -s $newhomelocal/Movies | awk '{ print $1 }'`
sleep 1

# Pictures
echo -e "\nCopying Pictures..."
#rsync --recursive --links --group --owner --perms --times --update /Volumes/oldmac/Pictures/ /Users/$loggedinuser/Pictures
rsync -ae ssh --info=progress2 --recursive --links --group --owner --perms --times --update $oldusername@$ipaddress:$oldhomelocal/Pictures/ $newhomelocal/Pictures
echo "Pictures copy finished."
newpicturessize=`du -s $newhomelocal/Pictures | awk '{ print $1 }'`
sleep 1

# Music
echo -e "\nCopying Music..."
#rsync --recursive --links --group --owner --perms --times --update --exclude 'iTunes' /Volumes/oldmac/Music/ /Users/$loggedinuser/Music
rsync -ae ssh --info=progress2 --recursive --links --group --owner --perms --times --update $oldusername@$ipaddress:$oldhomelocal/Music/ $newhomelocal/Music
echo "Music copy finished."
newmusicsize=`du -s $newhomelocal/Music | awk '{ print $1 }'`
sleep 1

# Public
echo -e "\nCopying Public..."
#rsync --recursive --links --group --owner --perms --times --update /Volumes/oldmac/Public/ /Users/$loggedinuser/Public
rsync -ae ssh --info=progress2 --recursive --links --group --owner --perms --times --update $oldusername@$ipaddress:$oldhomelocal/Public/ $newhomelocal/Public
echo "Public copy finished."
newpublicsize=`du -s $newhomelocal/Public | awk '{ print $1 }'`
sleep 1

# Fonts
echo -e "\nCopying Fonts..."
#rsync --recursive --links --group --owner --perms --times --update /Volumes/oldmac/Library/Fonts/ /Users/$loggedinuser/Library/Fonts
rsync -ae ssh --info=progress2 --recursive --links --group --owner --perms --times --update $oldusername@$ipaddress:$oldhomelocal/Library/Fonts/ $newhomelocal/Library/Fonts
#rsync --recursive --links --group --owner --perms --times --update /Volumes/oldmac/Library/FontCollections/ /Users/$loggedinuser/Library/FontCollections
rsync -ae ssh --info=progress2 --recursive --links --group --owner --perms --times --update $oldusername@$ipaddress:$oldhomelocal/Library/FontCollections/ $newhomelocal/Library/FontCollections
echo "Fonts copy finished."
newfontsnumber=`find $newhomelocal/Library/Fonts -ls | wc -l | sed -e 's/^[ \t]*//'`
sleep 1

# Safari Bookmarks
echo -e "\nCopying Safari Bookmarks..."
mkdir -p $newhomelocal/Library/Safari
#rsync --recursive --links --group --owner --perms --times --update /Volumes/oldmac/Library/Safari/Bookmarks.plist /Users/$loggedinuser/Library/Safari/Bookmarks.plist
rsync -ae ssh --recursive --links --group --owner --perms --times --update $oldusername@$ipaddress:$oldhomelocal/Library/Safari/Bookmarks.plist $newhomelocal/Library/Safari/Bookmarks.plist
if [[ -e $newuserlocal/Library/Safari/Bookmarks.plist ]]; then
  bookmarksresult="Safari Bookmarks copied successfully."
else
  bookmarksresult="There were no Safari bookmarks to copy."
fi
echo $bookmarksresult
sleep 1

# Extraneous folders in the home directory
echo -e "\nEvaluating extraneous folders in the user's home directory..."
IFS=$'\n'
exfoldersarray=( $(ssh $oldusername@$ipaddress 'ls -d */ | sed s'\''/\/$//'\'' | grep -v -e "Applications" -e "Desktop" -e "Documents" -e "Downloads" -e "Movies" -e "Pictures" -e "Music" -e "Public" -e "Library"'))
unset $IFS

if [ -z "$exfoldersarray" ]; then
  miscfolderresult="There were no extraneous folders in $loggedinuserlong home folder."
else
  arrayelementcount=${#exfoldersarray[@]}
  miscfolderresult="There were $arrayelementcount extraneous folder(s) in $loggedinuserlong home folder. They have been copied into a folder in their new Documents directory named Misc folders."
  mkdir -p $newhomelocal/Documents/Misc\ folders

  for element in "${exfoldersarray[@]}"; do
    echo -e "\nCopying $element"
    #rsync --recursive --links --group --owner --perms --times --update /Volumes/oldmac/$element/ /Users/$loggedinuser/Documents/Misc\ folders/"$element"
    rsync -ae ssh --recursive --links --group --owner --perms --times --update $oldusername@$ipaddress:$oldhomelocal/"'$element'"/ $newhomelocal/Documents/Misc\ folders/"$element"
    sleep 1
  done
fi
echo -e "\nEvaluation finished."

# Extraneous files in the home directory
echo -e "\nEvaluating extraneous files in the user's home directory..."
IFS=$'\n'
exfilesarray=( $(ssh $oldusername@$ipaddress 'ls -p | grep -v "/$"'))
unset $IFS

if [ -z "$exfilesarray" ]; then
  miscfileresult="There were no extraneous files in $loggedinuserlong home folder."
else
  arrayelementcount=${#exfilesarray[@]}
  miscfileresult="There were $arrayelementcount extraneous files in $loggedinuserlong home folder. They have been copied into a folder in their new Documents directory named Misc files."
mkdir -p $newhomelocal/Documents/Misc\ files

IFS=$'\n'
for element in "${exfilesarray[@]}"; do
  echo -e "\nCopying $element"
  #rsync --recursive --links --group --owner --perms --times --update /Volumes/oldmac/"$element" /Users/$loggedinuser/Documents/Misc\ files
  rsync -ae ssh --recursive --links --group --owner --perms --times --update $oldusername@$ipaddress:$oldhomelocal/"'$element'" $newhomelocal/Documents/Misc\ files
  sleep 1
done
unset $IFS
fi
echo -e "\nEvaluation finished.\n"

# Extraneous folders in the root folder.
echo -e "\nEvaluating extraneous folders in the root directory..."
sleep 1
IFS=$'\n'
exrootfoldersarray=( $(ssh $oldusername@$ipaddress 'cd /;ls -d */ | sed s'\''/\/$//'\'' | grep -v -e "Applications" -e "Contents" -e "FOTL" -e "Library" -e "System" -e "Users" -e "Network" -e "Volumes" -e "bin" -e "cores" -e "dev" -e "etc" -e "home" -e "net" -e "private" -e "sbin" -e "tmp" -e "usr" -e "var" -e "Local" -e "opt"'))

if [ -z "$exrootfoldersarray" ]; then
  miscrootfolderresult="There were no extraneous folders in the root folder."
else
  miscrootfolderresult="There were extraneous folders found in the root folder. They will not be copied to the new Mac because data should not have been stored there to begin with. Just so you are made aware, these are the folders that were found:"
  echo "${exrootfoldersarray[*]}"
  sleep 1
fi
unset $IFS
echo -e "\nEvaluation finished."
sleep 1

######################################################################
# I tried to get this next part working, but I ran into issues.      #
# This script is bring ran as a standard user and this part requires #
# admin rights.  For now, it isn't being used.                       #
######################################################################
# Munki SelfServeManifest. If this is copied, items that the user opted 
# to install from Managed Software Center's Self-serve area will 
# automatically be reinstalled.
#echo -e "\nCopying over the Managed Software Center self-serve data..."
#if [ -e /Volumes/$oldbootmountpoint/Library/Managed\ Installs/manifests/SelfServeManifest ]; then
#  rsync --recursive --links --group --owner --perms --times --update /Volumes/$oldbootmountpoint/Library/Managed\ Installs/manifests/SelfServeManifest /Library/Managed\ Installs/manifests/
#fi
#sleep 1

# Gather a contents list of the /Applications directory.
IFS=$'\n'
applications=( $(ssh $oldusername@$ipaddress 'cd /Applications;ls'))
unset $IFS

IFS=$'\n'
# Send an email to the tech.
echo -e "The user data for $loggedinuserlong has finished copying.\n\nHere is the summary of what was copied:\nDesktop: $newdesktopsize\nDocuments: $newdocumentssize\nDownloads: $newdownloadssize\nMovies: $newmoviessize\nMusic: $newmusicsize\nPictures: $newpicturessize\nPublic: $newpublicsize\nFonts: $newfontsnumber font(s) were copied\nSafari Bookmarks: $bookmarksresult\n\nExtraeous files and folders:\n$miscfolderresult\n$miscfileresult\n\n$miscrootfolderresult\n${exrootfoldersarray[*]}\n\nHere is a list of their Applications directory.  Most of the items here should already be installed.\n${applications[*]}" | mail -s "Data copy complete" $emailaddress
unset $IFS

elif [ $sourceresult == "An_old_user_account_on_this_computer" ]; then

# Proceed with this version of the script.
echo -e "\nOk, great. We're going to copy data from an old account on this machine."
read -p "Press any key to continue..."

# Make sure that the user is logged in, not the admin account.
echo -e "\nMake sure you are logged in with the user's network account, not the old, local account."
read -p "Are you logged in with the user's network account?(y/n)" userloggedinprompt

if [ $userloggedinprompt != "y" ];then
  echo -e "\nSorry, you must be logged in with the user's network account.  Exiting......."
  exit 0
fi

# Get the current logged in user.
loggedinuser=`ps aux 2> /dev/null | grep [l]oginwindow | cut -d " " -f1`
loggedinuserlong=`defaults read /Library/Preferences/com.apple.RemoteDesktop Text1`

# Prompt for the old username.
IFS=$'\n'
oldusernames=$(cd /Users;ls -d */  | sed s'/\/$//' | grep -v -e "Shared" -e "bmlgitadmin" -e "user" -e "$loggedinuser$")
read -p "Press any key to continue..."
echo -e "\nSelect the number for the option that matches the old username(1, 2, etc):"
select username in $oldusernames; do
  if [ -n "$username" ]; then
    oldusernameresult="$username"
  fi
  break
done
echo -e "\nUsing $oldusernameresult as the old username."
read -p "Press any key to continue..."
unset $IFS

# Change permissions of the old data from the old user to the new, network user.
echo -e "\nChanging permissions on the old data before we copy it.  Please wait..."
echo -e "\nPlease enter the password for the local account $oldusernameresult:" 
su "$oldusernameresult" -c "chmod -R 777 /Users/$oldusernameresult &>/dev/null"
read -p "Done. Press any key to continue..."

# Get the size of the old account's home folder
echo -e "\nCalculating size of data to be copied..."
oldhomefoldersize=`du -s -I Library -I "Microsoft User Data" -I ".Trash" "/Users/$oldusernameresult" | awk '{ print $1 }'`

# Get the size of the new Mac's hard drive, multiplied by 80%.
# We want to make sure that we won't be taking up more than
# 80% of the space on the new hard drive.
newhdspace=`df / | awk '{ print $4 }' | sed -n '2 p'`
newhdspace2=`echo "(($newhdspace * .80)+0.5)/1" | bc`

# Compare the two sizes and make a decision.
if [ $oldhomefoldersize -gt $newhdspace ]; then
  echo -e "\nWarning!!!!!"
  echo -e "\nThere is not enough space on this hard drive to copy all of the user's old data.\nLog in as the old account and either delete some data \nor move it to an external drive.\n"
  read -p "We cannot continue.  Press any key to exit..."
  exit 0
elif [ $oldhomefoldersize -gt $newhdspace2 ]; then
  echo -e "\nWarning!!!!!"
  echo -e "\nCopying over this user's data will use over 80% of the new hard drive's space.\nI strongly recommend that you log in as the old account and either delete some data \nor move it to an external drive.\n"
  read -p "Would you like to continue? (not recommended) (y/n)" spacewarnresponse
  if [ $spacewarnresponse == "n" ]; then
    echo -e "\nPlease try again after the user has reduced the size of their old home folder.\nExiting....."
    exit 0
  fi
fi

# Tell user to go chill
echo -e "\nAbout to start the copy process.\n"
read -p "What is your email address(not the user, you, reading this right now)?" emailaddress
if [ $oldhomefoldersize -gt 11000000 ]; then
	  echo -e "\nThere is more than 5GB of data to copy.\nGo relax. This might take a while.\nYou will receive an email summary when it's finished.\n"
	    read -p "Press any key to continue..."
    else
	      echo -e "\nThere is less than 5GB of data to copy.\nSit tight, it shouldn't take long.\nYou will also receive an email summary when it's finished.\n"
	        read -p "Press any key to continue..."
	fi

# Copy each folder
# Desktop
echo -e "\nCopying Desktop..."
rsync --recursive --links --group --owner --perms --times --update "/Users/$oldusernameresult/Desktop/" /Users/$loggedinuser/Desktop
echo "Desktop copy finished."
newdesktopsize=`du -sh /Users/$loggedinuser/Desktop | awk '{ print $1 }'`
sleep 1

# Documents
echo -e "\nCopying Documents..."
rsync --recursive --links --group --owner --perms --times --update --exclude 'Microsoft User Data' "/Users/$oldusernameresult/Documents/" /Users/$loggedinuser/Documents
echo "Documents copy finished."
newdocumentssize=`du -sh /Users/$loggedinuser/Documents | awk '{ print $1 }'`
sleep 1

# Downloads
echo -e "\nCopying Downloads..."
rsync --recursive --links --group --owner --perms --times --update "/Users/$oldusernameresult/Downloads/" /Users/$loggedinuser/Downloads
echo "Downloads copy finished."
newdownloadssize=`du -sh /Users/$loggedinuser/Downloads | awk '{ print $1 }'`
sleep 1

# Movies
echo -e "\nCopying Movies..."
rsync --recursive --links --group --owner --perms --times --update --exclude 'iTunes' "/Users/$oldusernameresult/Movies/" /Users/$loggedinuser/Movies
echo "Movies copy finished."
newmoviessize=`du -sh /Users/$loggedinuser/Movies | awk '{ print $1 }'`
sleep 1

# Pictures
echo -e "\nCopying Pictures..."
rsync --recursive --links --group --owner --perms --times --update "/Users/$oldusernameresult/Pictures/" /Users/$loggedinuser/Pictures
echo "Pictures copy finished."
newpicturessize=`du -sh /Users/$loggedinuser/Pictures | awk '{ print $1 }'`
sleep 1

# Music
echo -e "\nCopying Music..."
rsync --recursive --links --group --owner --perms --times --update --exclude 'iTunes' "/Users/$oldusernameresult/Music/" /Users/$loggedinuser/Music
echo "Music copy finished."
newmusicsize=`du -sh /Users/$loggedinuser/Music | awk '{ print $1 }'`
sleep 1

# Public
echo -e "\nCopying Public..."
rsync --recursive --links --group --owner --perms --times --update "/Users/$oldusernameresult/Public/" /Users/$loggedinuser/Public
echo "Public copy finished."
newpublicsize=`du -sh /Users/$loggedinuser/Public | awk '{ print $1 }'`
sleep 1

# Fonts
echo -e "\nCopying Fonts..."
rsync --recursive --links --group --owner --perms --times --update "/Users/$oldusernameresult/Library/Fonts/" /Users/$loggedinuser/Library/Fonts
rsync --recursive --links --group --owner --perms --times --update "/Users/$oldusernameresult/Library/FontCollections/" /Users/$loggedinuser/Library/FontCollections
echo "Fonts copy finished."
newfontsnumber=`find /Users/$loggedinuser/Library/Fonts -ls | wc -l | sed -e 's/^[ \t]*//'`
sleep 1

# Safari Bookmarks
echo -e "\nCopying Safari Bookmarks..."
mkdir -p /Users/$loggedinuser/Library/Safari
rsync --recursive --links --group --owner --perms --times --update "/Users/$oldusernameresult/Library/Safari/Bookmarks.plist" /Users/$loggedinuser/Library/Safari/Bookmarks.plist &>/dev/null
if [ -e /Users/$loggedinuser/Library/Safari/Bookmarks.plist ]; then
  bookmarksresult="Safari Bookmarks copied successfully."
else
  bookmarksresult="There were no Safari bookmarks to copy."
fi
echo $bookmarksresult
sleep 1

# Klok2 Data. Only a few users in the 93 wing have this, but might as well include it.
#echo -e "\nChecking to see if there is any Klok2 data to copy..."
#IFS=$'\n'
#klok2array=( $(cd "/Users/$oldusernameresult/Library/Preferences";ls -d */ | sed s'/\/$//' | grep "Klok"))
#unset $IFS

#if [ -z "$klok2array" ]; then
#  klokarrayresult="There was no Klok2 data found..."
#else
#  klokarrayresult="Klok2 data was found and has been copied."
#  for element in "${klok2array[@]}"; do
#    rsync --recursive --links --group --owner --perms --times --update "/Users/$oldusernameresult/Library/Preferences/$element/" /Users/$loggedinuser/Library/Preferences/"$element"
#    sleep 1
#  done
#fi
#echo $klokarrayresult

# Extraneous folders in the home directory
echo -e "\nEvaluating extraneous folders in the old acount's home directory..."
IFS=$'\n'
exfoldersarray=( $(cd "/Users/$oldusernameresult";ls -d */ | sed s'/\/$//' | grep -v -e "Applications" -e "Desktop" -e "Documents" -e "Downloads" -e "Movies" -e "Pictures" -e "Music" -e "Public" -e "Library"))
unset $IFS

if [ -z "$exfoldersarray" ]; then
  miscfolderresult="There were no extraneous folders in $loggedinuserlong home folder."
else
  arrayelementcount=${#exfoldersarray[@]}
  miscfolderresult="There were $arrayelementcount extraneous folder(s) in $loggedinuserlong home folder. They have been copied into a folder in their new Documents directory named Misc folders."
  mkdir -p /Users/$loggedinuser/Documents/Misc\ folders

  for element in "${exfoldersarray[@]}"; do
    echo -e "\nCopying $element"
    rsync --recursive --links --group --owner --perms --times --update "/Users/$oldusernameresult/$element/" /Users/$loggedinuser/Documents/Misc\ folders/"$element"
    sleep 1
  done
fi
echo -e "\nEvaluation finished."

# Extraneous files in the home directory
echo -e "\nEvaluating extraneous files in the old account's home directory..."
IFS=$'\n'
exfilesarray=( $(cd "/Users/$oldusernameresult/";ls -p | grep -v "/$"))
unset $IFS

if [ -z "$exfilesarray" ]; then
  miscfileresult="There were no extraneous files in $loggedinuserlong home folder."
else
  arrayelementcount=${#exfilesarray[@]}
  miscfileresult="There were $arrayelementcount extraneous files in $loggedinuserlong home folder. They have been copied into a folder in their new Documents directory named Misc files."
mkdir -p /Users/$loggedinuser/Documents/Misc\ files

for element in "${exfilesarray[@]}"; do
  echo -e "\nCopying $element"
  rsync --recursive --links --group --owner --perms --times --update /Users/"$oldusernameresult"/"$element" /Users/$loggedinuser/Documents/Misc\ files
  sleep 1
done
fi
echo -e "\nEvaluation finished.\n"

# Modify /etc/postfix/main.cf so that the email will work.
relayhost=`cat /etc/postfix/main.cf | grep "^relayhost" | cut -d " " -f3`
if [ $relayhost != "o365relay.orchard.fruit.com" ]; then
  echo "relayhost = o365relay.orchard.fruit.com" >> /etc/postfix/main.cf
fi

IFS=$'\n'
# Send an email to the tech.
echo -e "The user data for the old account $oldusernameresult has finished copying to the new user account $loggedinuser.\n\nHere is the summary of what was copied:\nDesktop: $newdesktopsize\nDocuments: $newdocumentssize\nDownloads: $newdownloadssize\nMovies: $newmoviessize\nMusic: $newmusicsize\nPictures: $newpicturessize\nPublic: $newpublicsize\nFonts: $newfontsnumber font(s) were copied\nSafari Bookmarks: $bookmarksresult\n\nExtraeous files and folders:\n$miscfolderresult\n$miscfileresult" | mail -s "Data copy complete" $emailaddress
unset $IFS

else
echo -e "\nYou didn't enter a proper response. Please run the script again..."
read -p "Press any key to exit..."
exit 0

fi

#Exit this terminal window, after bring prompted.
clear
echo -e "\nData copy complete.\n"
read -p "Press any key to exit..."
osascript -e 'tell application "Terminal" to close (every window whose name contains "copy_user_data")' &
exit
