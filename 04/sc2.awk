#!/usr/bin/awk -f
# How to call this script
# awk -f sc2.awk dictionary word_to_translate item
# Exmaple:
# awk -f sc2.awk lab10e04vocabolario.txt ultimi 2
# The script returns:
# found shortest longest item_translated
# found=0  means not found
# found=1  menas found
BEGIN {
	ARGC=2
	argv2 = sprintf("^%s:$", ARGV[2]);
	found=0
	ind=1
}


$0 ~ argv2 {
	found=1
	print $0
	trad=""
	shortestlen=99999
	longestlen=0
	while(1) {
		getline trad  
		if(match(trad, "#")) break
		if(ind == ARGV[3]) {
			posword=trad
		}
		ind++
		if(length(trad) < shortestlen) {
			shortestword=trad
			shortestlen=length(trad)
		}	
		if(length(trad) > shortestlen) {
			longestword=trad
			longestlen=length(trad)
		}	
	}	
}
END {
	print found " "	shortestword " " longestword " " posword
}
