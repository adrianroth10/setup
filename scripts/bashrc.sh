#!/bin/bash
# Adding some useful aliases and exports to .bashrc
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
. $DIR/../../extras/functions.sh

add_line ~/.bashrc "function mkcd { dir=\"\$*\"; mkdir -p \"\$dir\" && cd \"\$dir\"; }"

add_line ~/.bashrc "# Aliases"
add_line ~/.bashrc "alias ..=\"cd ..\""
add_line ~/.bashrc "alias ...=\"cd ../..\""
add_line ~/.bashrc "alias go=\"gnome-open\""
add_line ~/.bashrc "alias gccw=\"/opt/mingw32/bin/i686-w64-mingw32-gcc\""
add_line ~/.bashrc "alias tohyllie=\"cd ~/Documents/hyllieAnalys/hyllieanalys\""
add_line ~/.bashrc "alias sprint=\"vim ~/scrum/sprintbacklog*\""

add_line ~/.bashrc "# Git aliases"
add_line ~/.bashrc "alias gs=\"git status\""
add_line ~/.bashrc "alias gc=\"git commit\""
add_line ~/.bashrc "alias gaa=\"git add -A\""
add_line ~/.bashrc "alias gca=\"git commit --amend\""

add_line ~/.bashrc "# extra paths"
# Matlab will be removed
add_line ~/.bashrc "export PATH=\"/usr/local/MATLAB/R2016b/bin:\$PATH\""
add_line ~/.bashrc "export PATH=\"\$HOME/scrum/scrumapp/bin:\$PATH\""
