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
	printf "* $(basename $SCRIPT)" >> $FILE
	LINE=$(head -n 1 $SCRIPT)
	if [ "$LINE" != "#!/bin/bash" ]; then
		printf ":\n  - ${LINE:2}" >> $FILE
	fi
	printf "\n" >> $FILE
done
