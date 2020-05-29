# Custom Functions
# Author: James Park

### My own functions:
fun () {
    print -l ${(ok)functions}
}


# Opens current git repo in the browser:
gi () {
    giturl=$(git config --get remote.origin.url)
    if [ -z "$giturl" ]
    then
        echo "Not a git repo or remote.origin.url not set!"
        return
    fi
    giturl=${giturl/:/\/}
    giturl=${giturl/git@/https:\/\/}
    giturl=${giturl/.git/\/}
    open $giturl
}

# Resets mac background system applications:
rsmac () {
    killall cfprefsd
    killall Dock
    killall Finder
    killall SystemUIServer
}

# Toggles wifi off and back on:
rswifi () {
    WIFIPORT=$(networksetup -listallhardwareports | grep -A 1 Wi-Fi | tail -n 1 | awk '{print $2}')
    echo "Wi-Fi adapter port number: $WIFIPORT"
    networksetup -setairportpower $WIFIPORT off
    networksetup -setairportpower $WIFIPORT on
    echo "Toggled off then on!"
}


### Zsh hook functions:
# Function to run immediately after a 'cd':
function chpwd() {
    ls -lah
}
