# Custom Aliases
# Author: James Park

alias dc="docker-compose"
alias dcr="docker-compose down -v && docker-compose up -d"
alias dm="docker-machine"
alias dr="docker"

if [[ -f $ZSH_CUSTOM/cheatsheet-jpark.sh ]]; then
	alias hh="less $ZSH_CUSTOM/cheatsheet-jpark.sh"
fi

alias ql="qlmanage -p "
