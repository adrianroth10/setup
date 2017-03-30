#!/bin/bash
# Only works for gmail accounts
# Encrypts your password using gpg in file ~/.password for your account
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
. $DIR/../extras/functions.sh

$PACKAGE_INSTALL mutt w3m

mkdir -p ~/.mutt/cache/headers
mkdir -p ~/.mutt/cache/bodies
touch ~/.mutt/certificates

printf "Full name: "
read NAME

printf "Gmail address: "
read EMAIL
EMAIL_SUFFIX="${EMAIL%%@*}"
if [ "${EMAIL##*@}" != "gmail.com" ]; then
	printf "${RED}This setup only works for gmail accounts\n${NO_COLOR}"
	exit 1
fi

printf "Password (put blank if you don't trust the script): "
read -s PASSWORD
printf "\n"
printf "#!/bin/sh\n" > ~/.mutt_exec.sh
if [ $PASSWORD ]; then
	rm -f ~/.password
	printf "export GMAIL_PASSWORD=%s" "$PASSWORD" > ~/.password_temp
	printf "Set Password for logging into mutt\n"
	gpg --no-use-agent --output ~/.password --symmetric ~/.password_temp
	rm -f ~/.password_temp

	printf "
pwds=\`gpg --no-use-agent --decrypt ~/.password\` >/dev/null 2>/dev/null
if [ \"\$?\" -ne \"0\" ]; then
	printf \"Error wrong password\\n\"
	exit 1
fi
eval \"\$pwds\"
" >> ~/.mutt_exec.sh
fi

printf "exec mutt \"\$@\"\n
" >> ~/.mutt_exec.sh
chmod u+rwx ~/.mutt_exec.sh
add_lines ~/.bashrc "alias mutt=\"~/.mutt_exec.sh\"
"
 
printf "# Basic muttrc for gmail
set imap_user = \"${EMAIL}\"
set imap_pass = \"\$GMAIL_PASSWORD\"

set smtp_url = \"smtp://${EMAIL_SUFFIX}@smtp.gmail.com:587/\"
set smtp_pass = \"\$GMAIL_PASSWORD\"
set from = \"${EMAIL}\"
set realname = \"${NAME}\"

set folder = \"imaps://imap.gmail.com:993\"
set spoolfile = \"+INBOX\"
set postponed=\"+[Gmail]/Drafts\"

set header_cache=~/.mutt/cache/headers
set message_cachedir=~/.mutt/cache/bodies
set certificate_file=~/.mutt/certificates

set move = no

alternative_order text/plain text/html
auto_view text/html
" > ~/.muttrc 

printf "text/html; /usr/bin/firefox %%s >/dev/null 2>&1; needsterminal
text/html; w3m -T text/html -dump %%s; copiousoutput
" > ~/.mailcap
