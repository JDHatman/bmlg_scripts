#!/bin/sh

loggedinuser=`ps aux 2> /dev/null | grep [l]oginwindow | cut -d " " -f1`

mkdir -p /Users/$loggedinuser/.ssh

# Create a file called "config" (if one doesn't exist already) and add a line at the end of the file.
echo "Host *
    StrictHostKeyChecking no" >> /Users/$loggedinuser/.ssh/config

exit 0
