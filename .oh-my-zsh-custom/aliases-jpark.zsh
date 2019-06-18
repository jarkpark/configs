# Custom Aliases
# Author: James Park

if [[ -f /usr/local/bin/python3 ]]; then
	alias python="/usr/local/bin/python3"
	alias python2="/usr/bin/python"
fi

if [[ -f $ZSH_CUSTOM/cheatsheet-jpark.sh ]]; then
	alias hh="less $ZSH_CUSTOM/cheatsheet-jpark.sh"
fi

