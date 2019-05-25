#!/bin/bash

#motd:
#echo -e "\033[1;37m" #make white
echo -e "\033[1;34m"
#random num in {0,1}
rNum=$RANDOM
motdNum=$(\ls $motd -1 | wc -l)
let "rNum %= motdNum"
let rNum=$rNum+1
cat $motd/$rNum

#LIGHT_GREEN="\[\033[0;32m\]"
#LIGHT_RED="\[\033[1;31m\]"
#BLUE="\[\033[0;34m\]"
#RED="\[\033[0;31m\]"
#WHITE="\[\033[1;37m\]"
#NO_COLOR="\[\033[0m\]"

echo -e "\033[0;31mUseful Vars [paths symlinked w _]: \033[1;37m"

echo -e "\033[0;32m>>\033[1;37m~/.env_paths.sh"

for ix in ${!_print_paths[*]}
do
    v=${_print_paths[$ix]}
    echo -e "\033[1;37m    \$$v \033[0;32m=\033[1;37m ${!v}"
    #printf "    =$%s\n" "${_print_paths[$ix]}"
done
unset _print_paths

echo -e "\033[0;32m>>\033[1;37m~/.env_aliases.sh"

echo ${_print_aliases[*]}
unset _print_aliases

#To do list
#echo -e "\033[0;31mTo do [~/.todo]: \033[1;37m"
echo -e "\033[0;31m$(date) [~/.todo]: \033[1;37m"
#cat ~/.todo
cat $doku/start.txt
echo

#Nice prompt
#PS1="[\D{%H%M}|\u@\h\]->\$PWD>>"
#Coloured:
PS1="\[\033[0;32m\][\[\033[0;31m\]\D{%H%M}\[\033[0;32m\]\
|\[\033[0;31m\]\u\[\033[0;32m\]@\[\033[0;31m\]\
\h\[\033[0;32m\]]\[\033[0;31m\]->\[\033[1;37m\]\$PWD\
\[\033[0;32m\]>>\[\033[1;37m\]"
