#!/usr/bin/awk -f
BEGIN {
	print ARGC;
	ARGC=2;
	cmp = sprintf("^%s$", ARGV[2]);
}

$4 ~ cmp {printf "%s\n",  $14}

