#!/bin/bash

# Secure Browser Kiosk
#
# This script launches Chrome in incognito mode, 
# waits a period of time, then prompts the user 
# if they need more time. If the user doesn't need 
# anymore time, the browser will close and remove 
# downloads and restart in incognito mode.

main() {
    echo "Secure Browser Kiosk running..."
    secure_browser_kiosk "$1"
}

clean_after_loop() {
    killall "Google Chrome"
    rm -rf "$HOME"/Downloads/*
    echo "Secure Browser Kiosk restarting due to user selecting \"No\""
}

loop_through_timeout() {
    # Loop while the answer is "Yes" on the timeout specified
    local timeout
    timeout=${1:-"300"}
    while [[ $PROMPT = "button returned:Yes" ]]; do
        sleep "$timeout"
        PROMPT="$(osascript -e 'display dialog "Do you need more time? Selecting No will restart Chrome and remove Downloads." buttons {"Yes", "No"} with icon stop')"
        if [[ $PROMPT = "button returned:Yes" ]]; then
            echo "Secure Browser Kiosk session continuing due to user selecting \"Yes\""
        fi
    done
}

start_chrome() {
    open -a /Applications/Google\ Chrome.app --args --incognito
}

secure_browser_kiosk() {
    # Eternally run the script until the process is explicitly killed
    while ! [[ $PROMPT = "Loop" ]]; do
        PROMPT="button returned:Yes"
        sleep 5
        start_chrome
        loop_through_timeout "$1"
        clean_after_loop
    done
}

main "$1"
