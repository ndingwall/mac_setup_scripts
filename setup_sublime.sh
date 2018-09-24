#!/bin/sh

echo "First, install Package Control. See https://packagecontrol.io/installation#Simple"
read -p "Press any key to continue once done."

# Copy sublime-text-3 settings
CURDIR=$(dirname "$0")
cp -rf $CURDIR/sublime-settings/* ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User
