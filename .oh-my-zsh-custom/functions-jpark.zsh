# Custom Functions
# Author: James Park

# Function toggle wifi off and on
togglewifi () {
	WIFIPORT=$(networksetup -listallhardwareports | grep -A 1 Wi-Fi | tail -n 1 | awk '{print $2}')
	echo "Wi-Fi adapter port number: $WIFIPORT"
	networksetup -setairportpower $WIFIPORT off
	networksetup -setairportpower $WIFIPORT on
	echo "Toggled off then on!"
}

# Function to open current git repo in the browser
# git@bitbucket.org:sambatv/recommendations-api.git
# https://bitbucket.org/sambatv/recommendations-api/
# git@github.com:jarkpark/dotfiles.git
# https://github.com/jarkpark/dotfiles
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

# Zsh hook functions
function chpwd() {
    ls -lah
}
