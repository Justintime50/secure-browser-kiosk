# Secure Browser Kiosk
A simple app that opens and closes Chrome in incognito mode asking if the user needs more time after a timeout.

## Setup
1. Ensure the scripts are executable.
2. Ensure that all screen savers and timeouts for logout on your computer are turned off. If they are not, the script will be interrupted. These can be found in various places:
   1. System Preferences -> Desktop & Screen Saver -> Start after: none (found in the bottom left corner)
   2. System Preferences -> Energy Saver -> Never turn off or put to sleep
   3. Security & Privacy -> Advanced -> Logout after settings (this can be turned on if you plan to use the script as a login item since it would be restarated afte login anyway.)

## Usage
Either run the scripts as standalone or use `Automator` to package them into an app and add the app as a Login Item to a standard account therefore creating a Kiosk that can't be quit.

## Gotchas
Currently, if the app is added as a login item, it will loop continually until you have removed it from a login item and logout. Even if the script and app are exited from the nav bar or from activity monitor, it will come back.