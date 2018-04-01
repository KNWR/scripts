#!/bin/sh

# program which, 15 minutes after being run,  adds and commits everything in the directory


# little function to print the command to the terminal, and then run it
echo_me() {
	echo $@
	$@
}

timeDelay = 15
#convert 15 to minutes


# the commit message is the first argument the script is called with
message = $1

# wait for the specified delay
sleep $timeDelay

# ok what's the commit message - specified after or before?
# should double check to ask if want to commit whatever's coded ? or not, if this is for max to the metal focus ... 

echo "git add -A"
echo "git commit -m "

# what i want on the terminal screen, once we've decided we're committing is:

# echo_me git add -A
# echo_me git commit -m \"$message\"
