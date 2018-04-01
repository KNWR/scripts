#!/bin/sh

# little function to print the command to the terminal, and then run it

echo_me() {
	echo $@
	"$@" #previously eval "$@", but this works too 
}

echo_me git add -A
echo_me git commit -m \""$*"\" # "$*" worked too, but this feels safer ... maybe nonsense
echo_me git push origin master 
