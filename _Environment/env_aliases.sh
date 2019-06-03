#!/bin/bash

alias ls='ls -al --group-directories-first --color -hF'

#Create the hierarchy automatically
alias mkdir='mkdir -pv'
alias path='echo -e ${PATH//:/\\n}'
#Open ports
alias ports='netstat -tulanp'

## Colorize the grep command output for ease of use (good for log files)##
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

#flip screen colours
alias neg='xcalib -i -a'

#wee
alias fuck='sudo $(history -p \!\!)'
alias emacs='emacs -fs'

## get rid of command not found ##
alias cd..='cd ..'

## a quick way to get out of current directory ##
alias ..='cd ..'
alias ...='cd ../../../'
alias ....='cd ../../../../'
alias .....='cd ../../../../'
alias .4='cd ../../../../'
alias .5='cd ../../../../..'

## avoid ABI error
alias gpp='g++ -D_GLIBCXX_USE_CXX11_ABI=0'

export _print_aliases=("ls" "mkdir" "path" "ports" "grep" "egrep" "fgrep"
                       "neg" "cd" ".." "..."
                       "gpp")
