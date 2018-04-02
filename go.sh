#!/bin/sh

# program which, 15 minutes after being run,  adds and commits everything in the directory
# basically, a forcing function - you better get some code written and stuff done

# little function to print the command to the terminal, and then run it
echo_me() {
	echo $@
	eval "$@" # "@", @ did NOT work - they messed up the commit message
}

# wait for the specified delay
# if want to set timeDelay from cmdargs can just get it as the first arg, then shift and still store $* into 'message' variable, as commit message
timeDelay=1
sleep $(($timeDelay*60))

# store the commit message; the commit message is the first argument the script is called with
# ok what's the commit message - specified after or before? in this case, specified in the cmd line args
message=$*

#get a notif ... terminal-notifier is an option ... 
echo -e "\a"
osascript -e 'display notification with title "Commit"'  # hate that can't get the terminal icon on this...


# ***** read -p method *****
# should double check to ask if want to commit whatever's coded ? or /not/, if this is for max to the metal focus ... 
read -p "Commit? y\n 	" decide
case $decide in
	Y|y ) echo_me git add -A
 		echo_me git commit -m \"$message\" # "$*" worked too, but this feels safer ... maybe nonsense
 		# also note that if want to add other options to this - ex. changing the amount of time, via command line argument, $* will be problematic
 			# ... could parse the string, or figure out how to have char[space]char be considered $1, the first argument even though space within , and then have a 2nd arg, $2 after that
		echo_me git push origin master 
		break ;;
	N|n ) break ;;
esac