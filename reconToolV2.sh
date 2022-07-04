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
        #echo -e "\t-e|--Exploit-DB \t\tVulnerability checker\t\t\t\t\t\t\t[passive]"
        #echo -e "\t-f|--FacebookDataExtractor \tExracts data from facebook  \t\t\t\t\t\t[passive]"
        echo -e "\t-dBa | --Dorking \t\t\tRun popular dorking searches using Baidu search engine\t\t\t[Passive]"
        echo -e "\t-dBi | --Dorking \t\t\tRun popular dorking searches using Bing search engine\t\t\t[Passive]"
        echo -e "\t-dD  | --Dorking \t\t\tRun popular dorking searches using Duck Duck Go search engine\t\t[Passive]"
        echo -e "\t-dG  | --Dorking \t\t\tRun popular dorking searches using Google search engine\t\t\t[Passive]"
        echo -e "\t-m   | --Google Map Request\t\tOpens google map to inputted location\t\t\t\t\t[Passive]"
        echo -e "\t-n   | --Name Server Enumeration \tLocating all DNS servers and corresponding records for a company\t[Passive/Active]"
        echo -e "\t-s   | --Shodan  \t\t\tIoT devices check\t\t\t\t\t\t\t[Passive]"
        echo -e "\t-t   | --Text file recon \t\tChecks for intel in Robots.txt & Security.txt of domain\t\t\t[Passive]"
        echo -e "\t-m   | --MetaDataExtractor\t\tExracts data from files\t\t\t\t\t\t\t[Passive]"
        echo -e "\t-w   | --Whois \t\t\t\tWhois URL check\t\t\t\t\t\t\t\t[Passive]"
}

if [ -z $QUIET ]; then
        echo -e "========================================================================================================================================"
	echo -e "${green}" \
                 "\t\t\t\t\t\t  ____                    _____           _  \n" \
                 "\t\t\t\t\t\t |  _ \ ___  ___ ___  _ _|_   _|__   ___ | | \n" \
                 "\t\t\t\t\t\t | |_) / _ \/ __/ _ \| '_ \| |/ _ \ / _ \| | \n" \
                 "\t\t\t\t\t\t |  _ <  __/ (_| (_) | | | | | (_) | (_) | | \n" \
                 "\t\t\t\t\t\t |_| \_\___|\___\___/|_| |_|_|\___/ \___/|_| \n" \
                 "${reset}\n"
	echo -e "========================================================================================================================================"
	echo -e "\n"
fi

#menu_help

if [ $HELP ]; then 
        menu_help
        exit
fi
