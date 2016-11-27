#!/bin/bash
if [ -f $1 ] 
then
	echo trovato
else
	echo non trovato
fi

if [ -z $1 ] 
then
	echo z yes
else
	echo z no
fi

echo $1
echo $#
let i=$#-1
echo ${!i}
