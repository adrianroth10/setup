#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

FILE=$DIR/../README.md

printf "# Setting up Ubuntu 14.04
Scripts to run for setting up various programs on an ubuntu machine
The background music have been provided by http://www.bensound.com

## Demo
![](demo.gif)

## Available scripts\n" > $FILE
SCRIPTS=$(find $DIR/../scripts -name '*.sh')

for SCRIPT in $SCRIPTS; do
	printf "* $(basename $SCRIPT) \n" >> $FILE
	while read LINE; do
		if [ "${LINE:0:2}" == "#!" ]; then
			continue
		fi
		if [ "${LINE:0:2}" != "# " ]; then
			break
		fi
		printf "  - ${LINE:2}\n" >> $FILE
	done < $SCRIPT
done

printf "\n\nThe input file also handles packages to be installed using the package manager. Just write the name as you would after for example \`sudo apt-get install\`\n" >> $FILE
