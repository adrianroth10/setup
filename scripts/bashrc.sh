#!/bin/bash
# Adding some useful aliases and exports to .bashrc
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
. $DIR/../extras/functions.sh

add_lines ~/.bashrc "function mkcd { dir=\"\$*\"; mkdir -p \"\$dir\" && cd \"\$dir\"; }

# Aliases
alias ..=\"cd ..\"
alias ...=\"cd ../..\"
alias go=\"gnome-open\"
alias gccw=\"/opt/mingw32/bin/i686-w64-mingw32-gcc\"
alias tohyllie=\"cd ~/Documents/hyllieAnalys/hyllieanalys\"
alias sprint=\"vim ~/scrum/sprintbacklog*\"

# Git aliases
alias gs=\"git status\"
alias gc=\"git commit\"
alias gaa=\"git add -A\"
alias gca=\"git commit --amend\"

# extra paths
export PATH=\"/usr/local/MATLAB/R2016b/bin:\$PATH\"
export PATH=\"\$HOME/scrum/scrumapp/bin:\$PATH\""
# Matlab will be removed
