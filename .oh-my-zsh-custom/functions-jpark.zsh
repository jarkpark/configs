# Custom Functions
# Author: James Park

### My own functions:
# Finds a file by name:
f () {
    find ~ -path ~/Pictures/Photos\ Library.photoslibrary -prune -o \
        -path ~/Library/Application\ Support -prune -o \
        -path ~/Library/IdentityServices -prune -o \
        -path ~/Library/Messages -prune -o \
        -path ~/Library/HomeKit -prune -o \
        -path ~/Library/Mail -prune -o \
        -path ~/Library/Safari -prune -o \
        -path ~/Library/Suggestions -prune -o \
        -path ~/Library/Containers -prune -o \
        -path ~/Library/PersonalizationPortrait -prune -o \
        -path ~/Library/Metadata -prune -o \
        -path ~/Library/Cookies -prune -o \
        -path ~/Library/Caches -prune -o \
        -iname "*$@*" -print
}

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
rs () {
    killall cfprefsd
    killall Dock
    killall Finder
    killall SystemUIServer
}

# Toggles wifi off and back on:
rw () {
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
