#!/bin/sh

# could create flag -c or something that makes the design files 
	# 1 design file in the readme? or separate files - focus; user & constraints; exploration; expansion

projName=$1
mkdir $projName
cd $projName
echo "# $projName\n\n" > README.md # normal
# echo "# $projName\n\n## Focus\n\n\n\n## User & Constraints\n\n\n\n## Exploration\n\n\n\n## Expansion" > README.md # all in the readme


