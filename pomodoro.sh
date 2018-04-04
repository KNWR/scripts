#!/bin/sh

Focus=$1
Diffuse=$2

Focus=$(($Focus*60))
Diffuse=$(($Diffuse*60))

echo "Let's go"

while true; do
	sleep $Focus
	osascript -e 'display notification with title "Pomodoro: Eustress => recovery" '

	sleep $Diffuse
	osascript -e 'display notification with title "Pomodoro: go"'
done

# possible additions
	# 5m, 1m warnings
	# logging time worked, when cancelled => to show progression in ability to focus => could have a variation that just lets you max your focus, with consistent rests
	# 


