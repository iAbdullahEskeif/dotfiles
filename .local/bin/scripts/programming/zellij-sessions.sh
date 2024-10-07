#!/usr/bin/env zsh
new=`echo new session`
x=$(zellij list-sessions | awk '{print $1}')
selected=$(printf "new session\n$x" | fzf --ansi)

if [[ -z $selected ]]; then
    exit 0
fi 

if [[ ${selected} = 'new session' ]]
then
    zellij
else
    chosen=$(printf "󰁦 attach\n󰆴 delete" | fzf)  
    case "$chosen" in
        "󰁦 attach") zellij attach $selected;;
        "󰆴 delete") zellij delete-session $selected;;
        *) exit 1;;
    esac
fi

