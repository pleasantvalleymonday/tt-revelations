#!/bin/sh
cd ..

export DYLD_LIBRARY_PATH=`pwd`/Libraries.bundle
export DYLD_FRAMEWORK_PATH="Frameworks"

# Get the user input:
read -p "Username: " ttjUsername
read -p "Gameserver (DEFAULT:  167.114.28.238): " TTJ_GAMESERVER
TTJ_GAMESERVER=${TTJ_GAMESERVER:-"167.114.28.238"}

# Export the environment variables:
export ttjUsername=$ttjUsername
export ttjPassword="password"
export TTJ_PLAYCOOKIE=$ttjUsername
export TTJ_GAMESERVER=$TTJ_GAMESERVER

echo "==============================="
echo "Starting Toontown Journey..."
echo "Username: $ttjUsername"
echo "Gameserver: $TTJ_GAMESERVER"
echo "==============================="

ppython -m toontown.toonbase.ToontownStart
