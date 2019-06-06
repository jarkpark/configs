# Source this from ~/.bash_profile

# git autocompletion from
# https://github.com/git/git/tree/master/contrib/completion
if [ -f ~/configs/git-completion.bash ]; then
	source ~/configs/git-completion.bash
fi

# git branch name in command prompt
# https://github.com/git/git/tree/master/contrib/completion
if [ -f ~/configs/git-prompt.sh ]; then
	source ~/configs/git-prompt.sh
	export PS1='\[\e[1;36m\]\w$(__git_ps1 " (%s)") $ \[\e[0m\]'
else
	export PS1='\[\e[1;36m\]\w $ \[\e[0m\]'
fi

# aliases
if [[ -f /Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl ]]; then
	alias subl="/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl"
fi

if [[ -f /usr/local/bin/python3 ]]; then
	alias python="/usr/local/bin/python3"
	alias python2="/usr/bin/python"
fi

alias lss="ls -Ghl"
alias lsa="ls -Gahl"

if [[ -f ~/configs/cheatsheet.sh ]]; then
	alias hh="less ~/configs/cheatsheet.sh"
fi

# handy functions
togglewifi () {
	WIFIPORT=$(networksetup -listallhardwareports | grep -A 1 Wi-Fi | tail -n 1 | awk '{print $2}')
	echo "Wi-Fi adapter port number: $WIFIPORT"
	networksetup -setairportpower $WIFIPORT off
	networksetup -setairportpower $WIFIPORT on
	echo "Toggled off then on!"
}

cdd () { cd "$@" && ls -Ghl; }

# to see if .bash_profile ran on this instance of terminal
echo "$PWD"
lss
