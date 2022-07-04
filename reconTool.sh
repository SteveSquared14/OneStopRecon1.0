#!/bin/bash

argument=()
while [[ $# -gt 0 ]]
do 
arg="$1" 

case $arg in 
     -h|--help)
     HELP=YES
     shift 
     ;;
   *)
   argument+=("$1")
   shift
   ;;
esac 
done 		


# Help function  to display usages
menu_help () {
	#echo -e "\t-e|--Exploit-DB \t\t${cyan}Vulnerability checker\t\t\t\t\t\t\t${red}[passive]${reset}"
	#echo -e "\t-f|--FacebookDataExtractor \t${cyan}Exracts data from facebook  \t\t\t\t\t\t${red}[passive]${reset}"
	echo -e "\t-dBa|--Dorking \t\t Run popular dorking searches using Baidu search engine${reset}"
	echo -e "\t-dBi|--Dorking \t\t Run popular dorking searches using Bing search engine${reset}"
	echo -e "\t-dD|--Dorking \t\t Run popular dorking searches using Duck Duck Go search engine${reset}"
	echo -e "\t-dD|--Dorking \t\t Run popular dorking searches using Google search engine${reset}"
	echo -e "\t-m|--googleMapRequest \t\t${cyan}Opens google map to inputted location\t\t\t\t\t${red}[passive]${reset}"
	echo -e "\t-n|--Name Server Enumeration  \t\t${cyan}Locating all DNS servers and corresponding records for a company\t${red}[passive/active]${reset}"	
	echo -e "\t-s|--shodan  \t\t\t${cyan}IoT devices check\t\t\t\t\t\t\t${red}[passive]${reset}"
	echo -e "\t-t|--Text file recon  \t\t${cyan}Checks for potential intelligence in Robots.txt and Security.txt files of domain\t\t\t\t\t\t${red}[passive]${reset}"
        echo -e "\t-m|--MetaDataExtractor \t\t${cyan}Exracts data from files\t\t\t\t\t\t\t${red}[passive]${reset}"
	echo -e "\t-w|--whois \t\t\t${cyan}Whois URL check\t\t\t\t\t\t\t\t${red}[passive]${reset}"
}

if [ -z $QUIET ]; then
	echo -e "${green}" \
		 "  ____                    _____           _  \n" \
                 " |  _ \ ___  ___ ___  _ _|_   _|__   ___ | | \n" \
                 " | |_) / _ \/ __/ _ \| '_ \| |/ _ \ / _ \| | \n" \
                 " |  _ <  __/ (_| (_) | | | | | (_) | (_) | | \n" \
                 " |_| \_\___|\___\___/|_| |_|_|\___/ \___/|_| \n" \
		 "${reset}\n"
fi

menu_help

if [ $HELP ]; then 
	menu_help
	exit
fi
