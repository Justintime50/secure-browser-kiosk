#!/bin/bash

# Secure Browser Kiosk
#
# This script launches Chrome in incognito mode, 
# waits a period of time, then prompts the user 
# if they need more time. If the user doesn't need 
# anymore time, the browser will close and remove 
# downloads and restart in incognito mode.

PROMPT="button returned:Yes"

# Eternally run the script until the process is explicitly killed
while ! [[ $PROMPT = "Loop" ]]; do

    PROMPT="button returned:Yes"
    sleep 5
    open -a /Applications/Google\ Chrome.app --args --incognito

        while [[ $PROMPT = "button returned:Yes" ]]; do
            sleep 300 # timeout clock in seconds
            PROMPT="$(osascript -e 'display dialog "Do you need more time? Selecting No will restart Chrome and remove Downloads." buttons {"Yes", "No"} with icon stop')"
        done

    killall "Google Chrome"
    rm -rf "$HOME"/Downloads/*

done
