PROMPT="button returned:Yes"

while ! [[ $PROMPT = "Loop" ]]; do # eternally run the script

    PROMPT="button returned:Yes"
    sleep 2
    open -a /Applications/Google\ Chrome.app --args --incognito

        while [[ $PROMPT = "button returned:Yes" ]]; do
            sleep 300 # timeout clock in seconds
            PROMPT="$(osascript -e 'display dialog "Do you need more time? Selecting No will restart Chrome." buttons {"Yes", "No"} with icon stop')"
        done

    killall "Google Chrome"

done # end the eternal loop since it can't be escaped with anything but a yes or not prompt