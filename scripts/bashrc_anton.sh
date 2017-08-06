#!/bin/bash
# Adding some useful aliases and exports to .bashrc
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
. $DIR/../extras/functions.sh

add_lines ~/.bashrc "function mkcd { dir=\"\$*\"; mkdir -p \"\$dir\" && cd \"\$dir\"; }

# Aliases
alias ..=\"cd ..\"
alias ...=\"cd ../..\"
alias go=\"xdg-open\"

# Git aliases
alias gs=\"git status\"
alias gc=\"git commit\"
alias gaa=\"git add -A\"
alias gca=\"git commit --amend\"

# ROOT aliases
alias root=\"root -l\"
alias root_valgrind=\"valgrind --tool=memcheck --suppressions=$ROOTSYS/etc/valgrind-root.supp --log-file=log --leak-check=full\"

"
