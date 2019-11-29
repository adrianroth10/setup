#!/bin/bash
# Adding some useful aliases and exports to .bashrc
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
. $DIR/../extras/functions.sh

add_lines ~/.bashrc "function mkcd { dir=\"\$*\"; mkdir -p \"\$dir\" && cd \"\$dir\"; }

# Aliases
alias ..=\"cd ..\"
alias ...=\"cd ../..\"
alias go=\"xdg-open\"
alias sprint=\"vim ~/scrum/sprintbacklog*\"
alias idag=\"vim ~/scrum/idag\"
alias bt=\"bluetoothctl\"
alias accio=\"ag\"

# Git aliases
alias gs=\"git status\"
alias gc=\"git commit\"
alias gaa=\"git add -A\"
alias gca=\"git commit --amend\"
alias gp=\"git push\"

# extra paths
export PATH=\"\$HOME/scrum/scrumapp/bin:\$PATH\"

# ROOT aliases
alias root=\"root -l\"
alias root_valgrind=\"valgrind --tool=memcheck --suppressions=$ROOTSYS/etc/valgrind-root.supp --log-file=log --leak-check=full\"

alias fetch_pwds=\"scp anton@xi.nuclear.lu.se:/home/anton/Documents/småttogott/importantos.kdbx ~/Documents/Övrigt/Computer\"
alias send_pwds=\"scp ~/Documents/Övrigt/Computer/importantos.kdbx anton@xi.nuclear.lu.se:/home/anton/Documents/småttogott/importantos.kdbx\"
bind 'set completion-ignore-case on'

alias single=\"xrandr --output HDMI-1 --auto; xrandr --output eDP-1 --off\"

"
