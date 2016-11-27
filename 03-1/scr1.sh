#!/bin/bash

if [ $# -eq 1 ] 
then
	echo 1 args
fi

printf "%s\n" $1

echo $1 | grep -E ^[0-9]+$

if [ $? -eq 0 ] 
then 
	echo number
	ps -el | awk -f scr2.awk - $1
else 
	echo not a number
fi
