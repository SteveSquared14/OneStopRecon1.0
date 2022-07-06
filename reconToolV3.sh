##!/bin/bash

PathDir=/home/cipher/ReconTool
. $PathDir/functionLibrary.sh

#DorkingPath=/home/cipher/ReconTool
#. $PathDir/googleDorking.sh

#whoIsFunc matillion.com
   


#Help function  to display usages
menu_help () {
        #echo -e "\t-e|--Exploit-DB \t\tVulnerability checker\t\t\t\t\t\t\t[passive]"
        #echo -e "\t-f|--FacebookDataExtractor \tExracts data from facebook  \t\t\t\t\t\t[passive]"
        echo -e "\t-dBa | --Dorking \t\t\tRun popular dorking searches using Baidu search engine\t\t\t[Passive]"
        echo -e "\t-dBi | --Dorking \t\t\tRun popular dorking searches using Bing search engine\t\t\t[Passive]"
        echo -e "\t-dD  | --Dorking \t\t\tRun popular dorking searches using Duck Duck Go search engine\t\t[Passive]"
        echo -e "\t-dG  | --Dorking \t\t\tRun popular dorking searches using Google search engine\t\t\t[Passive]"
	echo -e "\t-g	| --grabbing banne r\t\t\t\tGain deatils about a system on a network\t\t\t[Passive]"
	echo -e "\t-M   | --MetaDataExtractor\t\tExracts data from files\t\t\t\t\t\t\t[Passive]"
        echo -e "\t-m   | --Google Map Request\t\tOpens google map to inputted location\t\t\t\t\t[Passive]"
        echo -e "\t-n   | --Name Server Enumeration \tLocating all DNS servers and corresponding records for a company\t[Passive/Active]"
        echo -e "\t-s   | --Shodan  \t\t\tIoT devices check\t\t\t\t\t\t\t[Passive]"
        echo -e "\t-t   | --Text file recon \t\tChecks for intel in Robots.txt & Security.txt of domain\t\t\t[Passive]"
        echo -e "\t-w   | --Whois \t\t\t\tWhois URL check\t\t\t\t\t\t\t\t[Passive]"
}

#if [ -z $QUIET ]; then
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
#fi

#commandLineSwitch=$1
#argumentToPass=$2

if [[ $commandLineSwitch == "--help" ]]; then 
        menu_help
        exit
fi

commandLineSwitch=$1
argumentToPass=( $2 )
arg=[$@]
echo  ${arg[0]} ${arg[1]}


# Google Maps


	if [[ $commandLineSwitch == "-m" ]]; then
		googleMaps  "$argumentToPass"
		exit 
	fi


# Name server Enumration

if [[ $commandLineSwitch == "-n" ]]; then
        dnsCheck "$argumentToPass"
	exit 
fi


# shodan 
if [[ $commandLineSwitch == "-s" ]]; then
        shodanFunc "$argumentToPass"
	exit 
fi

#robots.txt & security.txt 

if [[ $commandLineSwitch == "-t" ]]; then
        txtFileChecks "$argumentToPass"
	exit 
fi



#Metadata Extraction 

if [[ $commandLineSwitch == "-M" ]]; then
        metadataExtraction "$argumentToPass"
	exit
fi

#whois 

if [[ $commandLineSwitch == "-w" ]]; then
        whoIsFunc "$argumentToPass"
	exit 
fi





#Google Dorking

commandLineSwitch=$1
argumentToPass=$2


#if [ "#$" -gt 2 ]; then
#	if [[ $commandLineSwitch == "-m" ]]; then
#		googleMaps "$argumentToPass"
#        	exit
#	elif [[ $commandLineSwitch == "-n" ]]; then
#       			dnsCheck "$argumentToPass"
#			exit
#	elif [[ $commandLineSwitch == "-s" ]]; then
#        shodanFunc "$argumentToPass"
#        exit
#	elif [[ $commandLineSwitch == "-t" ]]; then
#        txtFileChecks "$argumentToPass"
#        exit 
#	elif [[ $commandLineSwitch == "-M" ]]; then
#        metadataExtraction "$argumentToPass"
#        exit
#	elif [[ $commandLineSwitch == "-w" ]]; then
#        whoIsFunc "$argumentToPass"
#        exit
#    fi
#elif [ "#$" -ne 2 ]; then
#	echo "2 args are needed."
#else
#	if [[ $commandLineSwitch == "-dBa" ]]; then
#		dorking_cache
#	elif [[ $commandLineSwitch == "-dBi" ]]
#		dorking_cache
#	elif [[ $commandLineSwitch == "-dD" ]]
#		dorking_cache
#	else [[ $commandLineSwitch == "-dG" ]]
#		dorking_cache
#fi

