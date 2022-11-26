#!/bin/bash

read -p "File name (with .txt): " File
read -p "Title: " Title
read -p "Date: " Date

if [ -z "$Title"  ] || [ -z "$File"  ] || [ -z "$Date"  ]; then
	echo -n "\033[31mError: \033[0m"
	echo "Variable is empty!"
	exit 0
fi

test -e posts/$File && echo -n "\033[31mError: File is exist!\033[0m" && exit 0

echo
read -p "Editor: " Editor

touch posts/$File

echo -n "\033[33mOpening ... \033[0m"
sleep 1
echo

$Editor "posts/$File"

if [ -s posts/$File ]; then 
	sed -i '1i'$Date posts/$File
	sed -i '1a'$Title posts/$File
	echo >> posts/$File
	echo
	sleep 1s
	echo Success!
	exit 0
else
	echo -n "\033[33mWarning: File is empty\033[0m" && rm -rf posts/$File
	exit 0
fi


