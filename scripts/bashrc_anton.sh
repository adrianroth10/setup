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

alias fetch_pwds=\"scp anton@xi.nuclear.lu.se:/home/anton/Documents/småttogott/importantos.kdbx ~/Documents/Övrigt/Computer\"
alias send_pwds=\"scp ~/Documents/Övrigt/Computer/importantos.kdbx anton@xi.nuclear.lu.se:/home/anton/Documents/småttogott/importantos.kdbx\"

"
grep -q -F 'function pandoc_html_css {\n name=${1/.*/.html}\n pandoc --css ~/.github-pandoc.css \$1 -o $name\n }\n' ~/.bashrc || printf 'function pandoc_html_css {\n name=${1/.*/.html}\n pandoc --css ~/.github-pandoc.css $1 -o $name\n }\n' >> ~/.bashrc
#https://superuser.com/questions/505857/set-the-terminal-prompt-in-ubuntu-to-show-only-the-working-directory-name-instea

