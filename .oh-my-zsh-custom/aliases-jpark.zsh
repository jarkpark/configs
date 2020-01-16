# Custom Aliases
# Author: James Park

alias dc="docker-compose"
alias dr="docker"
alias dm="docker-machine"

if [[ -f $ZSH_CUSTOM/cheatsheet-jpark.sh ]]; then
	alias hh="less $ZSH_CUSTOM/cheatsheet-jpark.sh"
fi

alias ql="qlmanage -p "
