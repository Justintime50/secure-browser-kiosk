#!/bin/bash

## PLAYING WITH SCREENSAVER OPTIONS HERE, DON'T USE THIS SRIPT IN PROD ##

PROMPT="button returned:Yes"

while ! [[ $PROMPT = "Loop" ]]; do # eternally run the script

    PROMPT="button returned:Yes"
    sleep 5
    open -a /Applications/Google\ Chrome.app --args --incognito

    SCREENSAVER="pgrep ScreenSaverEngine"
    sleep 300 # timeout clock in seconds

    while [[ ! -z $SCREENSAVER ]]; do

        while ! [[ $PROMPT = "button returned:No" ]]; do
            PROMPT="$(osascript -e 'display dialog "Do you need more time? Selecting No will restart Chrome." buttons {"Yes", "No"} with icon stop')"
        done

    killall "Google Chrome"
    rm -rf ~/Downloads

    done

done # end the eternal loop since it can't be escaped with anything but a yes or not prompt
