#!/usr/bin/awk -f
BEGIN {
	{printf "%s  ", "PID "; printf "%s\n", "NAME";} 
	i=0;
	j=0;
	rows=0;
}
$2 ~ "R$"  {
	printf "%s  ", $4; 
	printf "%s\n", $14; 
	pid[rows]=$4;
	name[rows]=$14;
	rows++;
}
$2 ~ "R\+$" {
	printf "%s  ", $4; 
	printf "%s\n", $14; 
	pid[rows]=$4;
	name[rows]=$14;
	rows++;
}



END {
	for(i=1; i<rows; i++) {
		for(j=i; j>0; j--) {
			if (pid[j-1]>pid[j]) {
				pid1=pid[j];
				pid[j]=pid[j-1];
				pid[j-1]=pid1;

				name1=name[j];
				name[j]=name[j-1];
				name[j-1]=name1;
			}
		}
	}
	for(i=0; i<rows; i++) {
		printf "%s  ", pid[i]; 
		printf "%s\n", name[i];
	} 
} 
