#!/bin/bash
# Verbose
# Uses mutt-wizard for installation
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
. $DIR/../extras/functions.sh

$PACKAGE_INSTALL dialog neomutt msmtp w3m gnupg2
# Did not manage to install with apt
sudo -H pip2 install offlineimap

read -p "Do you want to create gpg keypair for passsword encyption (y/N)?" CHOICE
case "$CHOICE" in
  y|Y ) gpg2 --full-generate-key;;
  * ) ;;
esac

git_clone_or_pull https://github.com/LukeSmithxyz/mutt-wizard.git ~/.config/mutt
~/.config/mutt/mutt-wizard.sh

read -p "What did you call your account? " ACCOUNT
offlineimap -a $ACCOUNT

add_lines ~/.bashrc "# Neomutt
export EDITOR=vim
"
add_lines ~/.config/mutt/muttrc "macro index,pager d \"<save-message>=Archive<enter><enter>\" \"Archive\"
"

# If you have protonmail with bridge check out https://github.com/LukeSmithxyz/mutt-wizard/issues/95 for final fixes
# Change passwordeval in ~/.offlineimaprc and ~/.msmtprc to password and bridge password
# Comment "tls_trust_file	/etc/ssl/certs/ca-certificates.crt" in ~/.msmtprc and run 'msmtp --serverinfo --tls --tls-certcheck=off -a protonmail'
# Take the SHA256 fingerprint and append the following to the end of the ~/.msmtprc file: "tls_trust_file <Tab>\n tls_fingerprint <INSERT_FINGERPRINT>"
# Phew, now it should work!
