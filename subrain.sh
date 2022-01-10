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
	echo -e "
  ██████  █    ██  ▄▄▄▄    ██▀███   ▄▄▄       ██▓ ███▄    █ 
▒██    ▒  ██  ▓██▒▓█████▄ ▓██ ▒ ██▒▒████▄    ▓██▒ ██ ▀█   █ 
░ ▓██▄   ▓██  ▒██░▒██▒ ▄██▓██ ░▄█ ▒▒██  ▀█▄  ▒██▒▓██  ▀█ ██▒
  ▒   ██▒▓▓█  ░██░▒██░█▀  ▒██▀▀█▄  ░██▄▄▄▄██ ░██░▓██▒  ▐▌██▒
▒██████▒▒▒▒█████▓ ░▓█  ▀█▓░██▓ ▒██▒ ▓█   ▓██▒░██░▒██░   ▓██░
▒ ▒▓▒ ▒ ░░▒▓▒ ▒ ▒ ░▒▓███▀▒░ ▒▓ ░▒▓░ ▒▒   ▓▒█░░▓  ░ ▒░   ▒ ▒ 
░ ░▒  ░ ░░░▒░ ░ ░ ▒░▒   ░   ░▒ ░ ▒░  ▒   ▒▒ ░ ▒ ░░ ░░   ░ ▒░
░  ░  ░   ░░░ ░ ░  ░    ░   ░░   ░   ░   ▒    ▒ ░   ░   ░ ░ 
      ░     ░      ░         ░           ░  ░ ░           ░ 
                        ░                                   
 

made by dials, this is very ugly and prossibly broken... ¯\_(ツ)_/¯"

	sleep 1s

	echo -e "running assetfinder on ${BOLDCYAN}${1}${NORM}"

	cat $1| assetfinder | anewer $1_domains &>/dev/null #anew gh: https://github.com/tomnomnom/anew
	
	echo "$(wc -l < $1_domains) domains are sitting in file \"$1_domains\""
	echo "running assetfinder on 3rd level domains..."

	for domain in $1_domains
	do
		cat $domain | assetfinder | anewer $1_domains $>/dev/null
	done


fi