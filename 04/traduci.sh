#!/bin/bash

if [ $# -lt 3 ] 
then
	echo Too few arguments
	echo Usage ...
	echo traduci [options] vocabolario fileA fileB
	echo vocabolario: vocabolario contenente le traduzioni 
	echo dei termini
	echo fileA: file di testo da tradurre
	echo fileB: output del programma, file tradotto
	exit -1
fi
let arg_p=$#-1
if [ -z ${!arg_p} ] || [ ! -f  ${!arg_p} ] 
then 
	echo Error in file to translate name
	exit 1
fi  

let arg_p=$#-2
if [ -z ${!arg_p} ] || [ ! -f  ${!arg_p} ] 
then 
	echo Error in vocabulary file name
	exit 1
fi  
# options parse
if [ $# -ge 4 ] 
then 
	let idx=1
	while [ idx -le $#-3 ]
	do
		if [ ${!idx} == "--shortest" ]
		then
			let sho=1
		fi
	done


fi

for word in `cat $2` 
do
	echo $word
	echo $word | grep ^[^a-zA-Z]$
	if [ $? -eq 0 ] 
	then 
		echo punctuation
		echo $word
	else
		res=`awk -f sc2.awk $1 $word 1`
		let idx=0
		for resel in $res
		do
			resarr[$idx]=$resel
			let idx=$idx+1
		done
		# echo ${resarr[0]}
		# echo ${resarr[1]}
		# echo ${resarr[2]}
		# echo ${resarr[3]}
	fi
done
