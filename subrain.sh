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
	echo -e '
  ██████  █    ██  ▄▄▄▄    ██▀███   ▄▄▄       ██▓ ███▄    █ 
▒██    ▒  ██  ▓██▒▓█████▄ ▓██ ▒ ██▒▒████▄    ▓██▒ ██ ▀█   █ 
░ ▓██▄   ▓██  ▒██░▒██▒ ▄██▓██ ░▄█ ▒▒██  ▀█▄  ▒██▒▓██  ▀█ ██▒
  ▒   ██▒▓▓█  ░██░▒██░█▀  ▒██▀▀█▄  ░██▄▄▄▄██ ░██░▓██▒  ▐▌██▒
▒██████▒▒▒▒█████▓ ░▓█  ▀█▓░██▓ ▒██▒ ▓█   ▓██▒░██░▒██░   ▓██░
▒ ▒▓▒ ▒ ░░▒▓▒ ▒ ▒ ░▒▓███▀▒░ ▒▓ ░▒▓░ ▒▒   ▓▒█░░▓  ░ ▒░   ▒ ▒ 
░ ░▒  ░ ░░░▒░ ░ ░ ▒░▒   ░   ░▒ ░ ▒░  ▒   ▒▒ ░ ▒ ░░ ░░   ░ ▒░
░  ░  ░   ░░░ ░ ░  ░    ░   ░░   ░   ░   ▒    ▒ ░   ░   ░ ░ 
      ░     ░      ░         ░           ░  ░ ░           ░ 
                        ░                                   '

	
	echo
	echo -e "running assetfinder on ${BOLDCYAN}${1}${NORM}"
	# first round of domain enumeration
	# creates a new file and only adds unique domains
	cat $1| assetfinder | anewer $1_domains &>/dev/null #anew gh: https://github.com/tomnomnom/anew
	
	echo
	echo -e "$(wc -l < $1_domains) domains are sitting in file ${BOLDCYAN}\"$1_domains\"${NORM}"
	
	# removes anything other than 'foo.domain.com' and reruns assetfinder, essentially a weird spidering replacement
	# REMOVED - WILL REPLACE WITH SUBLIST3R	
	# echo
	# echo "Beginning recursive domain enumeration..."
	# rm -f -- $1_thirdlevel.tmp
	# grep -Po "(\w+\.\w+\.\w+)$" $1_domains | anewer $1_thirdlevel.tmp &>/dev/null
	# echo
	# echo "running assetfinder on 3rd level domains, this may take a while..."
	# cat $1_thirdlevel.tmp | assetfinder | anewer $1_domains &>/dev/null
	# echo 
	# echo "$(wc -l < $1_domains) domains are now sitting in file \"$1_domains\""
	# rm -r -- $1_thirdlevel.tmp

	runs the output of the previous steps through httprobe
	creates a new file named "hosts" with only live hosts
	cat $1_domains | httprobe -c 80 -prefer-https | anewer $1_hosts &>/dev/null
	echo
	echo -e "$(wc -l < $1_hosts) hosts are sitting in file ${BOLDCYAN}\"$1_hosts\"${NORM}"
	
	echo
	echo -e "done. created files: ${BOLDCYAN}\"$1_domains\" \"$1_hosts\"${NORM}"


fi

