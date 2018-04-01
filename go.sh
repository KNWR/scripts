#!/bin/sh

# program which, 15 minutes after being run,  adds and commits everything in the directory
# basically, a forcing function - you better get some code written and stuff done

# little function to print the command to the terminal, and then run it
echo_me() {
	echo $@
	eval "$@" # "@", @ did NOT work - they messed up the commit message
}

# store the commit message; the commit message is the first argument the script is called with
message=$*

# note to self - no spaces between variable assignments
# minutes * 60 => seconds, sleep only takes seconds
timeDelay=1
timeDelay=$(($timeDelay*60))

# wait for the specified delay
sleep $timeDelay

#get a notif
say error

# ok what's the commit message - specified after or before? in this case, specified in the cmd line args
# should double check to ask if want to commit whatever's coded ? or not, if this is for max to the metal focus ... 

# ***** read -p method *****
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


# select method  - answer with a number corresponding to command
# echo "Commit?"
# select decide in "Y" "N"
# do
# 	case $decide in
# 		"Y") 
# 			echo_me git add -A
# 			echo_me git commit -m \""$message"\" # "$*" worked too, but this feels safer ... maybe nonsense
# 			# also note that if want to add other options to this - ex. changing the amount of time, via command line argument, $* will be problematic
# 				# ... could parse the string, or figure out how to have char[space]char be considered $1, the first argument even though space within , and then have a 2nd arg, $2 after that
# 			echo_me git push origin master 
# 			break;;
# 		"N") break;;
# 	esac
# done