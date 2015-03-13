#!/bin/bash

# Colors
green='\e[0;32m%-3s\e[0m'
red='\e[0;31m%-3s\e[0m'
blue='\e[0;34m%-3s\e[0m'
purple='\e[0;35m%-3s\e[0m'
nc='\e[0m%-3s' # no color

# Make sure this is a git repo
git status --porcelain &> /dev/null
if [ $? -ne 0 ]
then
	echo "Not a Git repository!"
	exit
fi

# ls -ls every file, shimming a git status for the working tree in front
for file in *
do
	gitstatus=`git status --porcelain $file`
	if [ -z "$gitstatus" ]
	then
		stat="-"
	else
		stat=${gitstatus:1:1} # grab the second char, which is the working tree status
	fi
	if [ $stat == "?" ]
	then
		printf $nc $stat
	elif [ $stat == "M" ]
	then
		printf $red $stat
	elif [ $stat == "A" ]
	then
		printf $blue $stat
	elif [ $stat == "D" ]
	then
		printf $purple $stat
	elif [ $stat == "-" ]
	then
		printf $green "OK"
	fi

	if [ ! -d $file ]
	then
		ls -lh $file
	else
		echo "(DIR)  $file" # ls -lh gives too much output for dirs, so just do this for now
	fi
done

