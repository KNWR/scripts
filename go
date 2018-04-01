#!/bin/sh

# program which, 15 minutes after being run,  adds and commits everything in the directory

timeDelay = 15
#convert 15 to minutes


# the commit message is the first argument the script is called with
message = $1

# wait for the specified delay
sleep $timeDelay

echo "git add -A"
echo "git commit -m "

#ok what's the commit message - specified after or before?
# should double check to ask if want to commit whatever's coded ? or not, if this is for max to the metal focus ... 
