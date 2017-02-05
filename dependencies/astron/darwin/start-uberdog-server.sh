#!/bin/sh
cd ../..

export DYLD_LIBRARY_PATH=`pwd`/Libraries.bundle
export DYLD_FRAMEWORK_PATH="Frameworks"

# Define some constants for our AI server:
MAX_CHANNELS=999999
STATESERVER=4002
ASTRON_IP="127.0.0.1:7100"
EVENTLOGGER_IP="127.0.0.1:7198"

# Get the user input:
read -p "Base channel (DEFAULT: 1000000): " BASE_CHANNEL
BASE_CHANNEL=${BASE_CHANNEL:-1000000}

echo "==============================="
echo "Starting Toontown Journey UberDOG server..."
echo "Base channel: $BASE_CHANNEL"
echo "Max channels: $MAX_CHANNELS"
echo "State Server: $STATESERVER"
echo "Astron IP: $ASTRON_IP"
echo "Event Logger IP: $EVENTLOGGER_IP"
echo "==============================="

while [ true ]
do
ppython -m toontown.uberdog.ServiceStart --base-channel $BASE_CHANNEL \
                 --max-channels $MAX_CHANNELS --stateserver $STATESERVER \
                 --astron-ip $ASTRON_IP --eventlogger-ip $EVENTLOGGER_IP
done