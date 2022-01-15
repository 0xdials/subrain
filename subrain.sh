#!/bin/bash


CYAN="36"
BOLDCYAN="\e[1;${CYAN}m"
NORM="\e[0m"




if [ $# -ne 1 ]
	then
    	echo "you goofed"
    	echo "./subrain <input> or -h for help"
elif [ $ == "-h" ]
	then
		echo "create file with at least one domain listed, seperated by newline"
		echo "./subrain <file_you_just_created>"
else
		
	echo
	echo -e "running assetfinder on ${BOLDCYAN}${1}${NORM}"
	# first round of domain enumeration
	# creates a new file and only adds unique domains
	cat $1| assetfinder | anewer $1_domains &>/dev/null #anew gh: https://github.com/tomnomnom/anew
	
	echo
	echo -e "$(wc -l < $1_domains) domains are sitting in file ${BOLDCYAN}\"$1_domains\"${NORM}"
	
	# runs the output of the previous steps through httprobe
	# creates a new file named "hosts" with only live hosts
	
	cat $1_domains | httprobe -c 80 -prefer-https | anewer $1_hosts &>/dev/null
	echo
	echo -e "$(wc -l < $1_hosts) hosts are sitting in file ${BOLDCYAN}\"$1_hosts\"${NORM}"
	
	echo
	echo -e "done. created files: ${BOLDCYAN}\"$1_domains\" \"$1_hosts\"${NORM}"


fi

