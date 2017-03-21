#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
. $DIR/../extras/functions.sh

$PACKAGE_INSTALL mutt

mkdir -p ~/.mutt/cache/headers
mkdir -p ~/.mutt/cache/bodies
touch ~/.mutt/certificates

add_lines ~/.muttrc "set imap_user = \"adrianroth10@gmail.com\"
set imap_pass =

set smtp_url = \"smtp://adrianroth10@smtp.gmail.com:587/\"
set smtp_pass =
set from = \"adrianroth10@gmail.com\"
set realname = \"Adrian Roth\"

set folder = \"imaps://imap.gmail.com:993\"
set spoolfile = \"+INBOX\"
set postponed=\"+[Gmail]/Drafts\"

set header_cache=~/.mutt/cache/headers
set message_cachedir=~/.mutt/cache/bodies
set certificate_file=~/.mutt/certificates

set move = no
"
# Make more generic for different emails
