# Custom Aliases
# Author: James Park

alias dc="docker-compose"
alias dcd="docker-compose down -v"
alias dcu="docker-compose up -d"
alias dcdu="docker-compose down -v && docker-compose up -d"
alias dm="docker-machine"
alias dr="docker"
alias ss="open -a ScreenSaverEngine"
alias ds='displayplacer "id:DE3B8BD7-2CEC-A6BC-A83E-EC38A7228B2E res:2560x1440 hz:60 color_depth:8 scaling:on origin:(0,0) degree:0" "id:F67E943B-5CBF-DCB1-8D34-60B49A966692 res:1792x1120 hz:59 color_depth:8 scaling:on origin:(-1792,320) degree:0" "id:515D2CC6-1A38-54A5-825C-0EDBCFE2988A res:1440x2560 hz:60 color_depth:8 scaling:on origin:(2560,-506) degree:270"'

if [[ -f $ZSH_CUSTOM/cheatsheet-jpark.sh ]]; then
	alias hh="less $ZSH_CUSTOM/cheatsheet-jpark.sh"
fi

alias ql="qlmanage -p $* &>/dev/null"
