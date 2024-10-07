#!/usr/bin/env bash
selected=`cat /home/aboud/.local/bin/scripts/programming/zellij-cht-languages /home/aboud/.local/bin/scripts/programming/zellij-cht-command | fzf`
if [[ -z $selected ]]; then
    exit 0
fi

read -p "Enter Query: " query

if grep -qs "$selected" /home/aboud/.local/bin/scripts/programming/zellij-cht-languages; then
    query=`echo $query | tr ' ' '+'`
    curl cht.sh/$selected/$query/\" && curl cht.sh/$selected/$query | bat 
else
    curl -s cht.sh/$selected~$query | bat
fi

