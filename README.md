<div align="center">

# Secure Browser Kiosk

Restart Chrome in incognito mode by prompting the user if they need more time.

[![Build Status](https://travis-ci.org/Justintime50/secure-browser-kiosk.svg?branch=master)](https://travis-ci.org/Justintime50/secure-browser-kiosk)
[![MIT Licence](https://badges.frapsoft.com/os/mit/mit.svg?v=103)](https://opensource.org/licenses/mit-license.php)

<img src="assets/showcase.png">

</div>

Secure Browser Kiosk is a macOS script that opens and closes Chrome in incognito mode and removes the user's downloads after prompting if the user needs more time (after 5 minutes of use) and they answer no.

## Install

To ensure the script can run uninterrupted, we'll need to do a few things first:

1. Ensure that all screen savers and timeouts for logout on your computer are turned off. If they are not, the script will be interrupted. These can be found in various places:
   1. System Preferences -> Desktop & Screen Saver -> Start after: none (found in the bottom left corner)
   1. System Preferences -> Energy Saver -> Never turn off or put to sleep
   1. Security & Privacy -> Advanced -> Logout after settings (this can be turned on if you plan to use the script as a login item since it would be restarated after login anyway.)

Alternatively, you could run the terminal command `caffeinate` to keep your Mac from sleeping while the script runs. You'll need to keep this terminal window up and running the entire time in addition to the script.

## Usage

Either run the script as standalone or use the macOS `Automator` app to package the script into an app. Then, add the app as a `Login Item` to a standard account which will create a Kiosk that can't be quit unless removed as a login item which would require an admin password to do.

**Standalone**

```bash
./secure-browser-kiosk.sh
```

## Gotchas

**App Loop:** Currently, if the app is added as a login item, it will loop continually until you have removed it from a login item and logout. Even if the script and app are exited from the nav bar or from activity monitor, it will come back.

**Catalina Downloads Permissions:** In Catalina, you'll need to allow the script access to the downloads folder the first time it's run if you'd like it to delete your downloads folder.
