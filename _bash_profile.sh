# Source this from ~/.bash_profile


# git autocompletion from
# https://github.com/git/git/tree/master/contrib/completion
if [ -f ~/configs/git-completion.bash ]; then
	source ~/configs/git-completion.bash
fi

# git branch name in command prompt from
# https://github.com/git/git/tree/master/contrib/completion
if [ -f ~/configs/git-prompt.sh ]; then
	source ~/configs/git-prompt.sh
	export PS1='\[\e[1;36m\]\w$(__git_ps1 " (%s)") $ \[\e[0m\]'
else
	export PS1='\[\e[1;36m\]\w $ \[\e[0m\]'
fi


# aliases
ALIASES="ALIASES:"

if [[ -f /Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl ]]; then
	alias subl="/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl"
	ALIASES=$"${ALIASES}\nsubl=\"/Applications/Sublime\\ Text.app/Contents/SharedSupport/bin/subl\""
fi

if [[ -f /usr/local/bin/python3 ]]; then
	alias python="/usr/local/bin/python3"
	ALIASES=$"${ALIASES}\npython=\"/usr/local/bin/python3\""
	alias python2="/usr/bin/python"
	ALIASES=$"${ALIASES}\npython2=\"/usr/bin/python\""
fi

alias lss="ls -Ghl"
ALIASES=$"${ALIASES}\nlss=\"ls -Ghl\""

alias lsa="ls -Gahl"
ALIASES=$"${ALIASES}\nlsa=\"ls -Gahl\""

if [[ -f ~/configs/cheatsheet.sh ]]; then
	alias hh="less ~/configs/cheatsheet.sh"
	ALIASES=$"${ALIASES}\nhh=\"less ~/configs/cheatsheet.sh\""
fi


# functions
FUNCTIONS="\n\nFUNCTIONS:"

togglewifi () {
	WIFIPORT=$(networksetup -listallhardwareports | grep -A 1 Wi-Fi | tail -n 1 | awk '{print $2}')
	echo "Wi-Fi adapter port number: $WIFIPORT"
	networksetup -setairportpower $WIFIPORT off
	networksetup -setairportpower $WIFIPORT on
	echo "Toggled off then on!"
}
FUNCTIONS=$"${FUNCTIONS}\ntogglewifi"

cdd () { cd "$@" && ls -Ghl; }
FUNCTIONS=$"${FUNCTIONS}\ncdd <filepath>"

ff () {
	find ~ -path ~/Pictures/Photos\ Library.photoslibrary -prune -o -path ~/Library -prune -o -iname "*$@*" -print
}
FUNCTIONS=$"${FUNCTIONS}\nff <file_or_directory>"


# snippets (echo all available aliases and functions)
alias snippets="echo -e \"$ALIASES\" echo -e \"$FUNCTIONS\""


# print some useful information and confirmation that _bash_profile.sh ran successfully
echo "$PWD"
lss

