#!/bin/bash

#PathDir=/home/sduckett/Documents/ReconTool
#. $PathDir/functionLibrary.sh

Path=/home/cipher/ReconTool
. $Path/googleDorking.sh
. $Path/functionLibrary.sh

#Help function  to display usages
menu_help () {
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
	#echo -e "\t-e|--Exploit-DB \t\tVulnerability checker\t\t\t\t\t\t\t[passive]"
        #echo -e "\t-f|--FacebookDataExtractor \tExracts data from facebook  \t\t\t\t\t\t[passive]"
        #echo -e " -dBa | --Dorking \t\t\tRun popular dorking searches using Baidu search engine\t\t\t[Passive]"
        echo -e " -dB | --Dorking \t\t\tRun popular dorking searches using Bing search engine\t\t\t[Passive]"
        echo -e " -dD  | --Dorking \t\t\tRun popular dorking searches using Duck Duck Go search engine\t\t[Passive]"
        echo -e " -dG  | --Dorking \t\t\tRun popular dorking searches using Google search engine\t\t\t[Passive]"
	echo -e " -g	| --grabbing banner \t\tGain deatils about a system on a network\t\t\t[Passive]"
	echo -e " -M   | --MetaDataExtractor\t\tExracts data from files\t\t\t\t\t\t\t[Passive]"
        echo -e " -m   | --Google Map Request\t\tOpens google map to inputted location\t\t\t\t\t[Passive]"
        echo -e " -n   | --Name Server Enumeration \tLocating all DNS servers and records for a company\t[Passive/Active]"
        echo -e " -s   | --Shodan  \t\t\tIoT devices check\t\t\t\t\t\t\t[Passive]"
        echo -e " -t   | --Text file recon \t\tChecks for intel in Robots.txt & Security.txt of domain\t\t\t[Passive]"
        echo -e "\t-w   | --Whois \t\t\tWhois URL check\t\t\t\t\t\t\t\t[Passive]"
}



#commandLineSwitch=$1
#argumentToPass=( $2 )
#arg=[$@]
#arg=($@)
#echo  ${arg[0]} ${arg[1]}


# Google Maps


	#if [[ $commandLineSwitch == "-m" ]]; then
	#	googleMaps  "$argumentToPass"
	#	exit 
	#fi


# Name server Enumration

#if [[ $commandLineSwitch == "-n" ]]; then
#        dnsCheck "$argumentToPass"
#	exit 
#fi


# shodan 
#if [[ $commandLineSwitch == "-s" ]]; then
#        shodanFunc "$argumentToPass"
#	exit 
#fi

#robots.txt & security.txt 

#if [[ $commandLineSwitch == "-t" ]]; then
#        txtFileChecks "$argumentToPass"
#	exit 
#fi



#Metadata Extraction 

#if [[ $commandLineSwitch == "-M" ]]; then
#        metadataExtraction "$argumentToPass"
#	exit
#fi

#whois 

#if [[ $commandLineSwitch == "-w" ]]; then
#        whoIsFunc "$argumentToPass"
#	exit 
#fi





#Google Dorking

commandLineSwitch=$1
argumentToPass=$2


if [ "$#" -gt "2" ]; then
	#working with array of args as of 6/7/22 - may need to pass array here instead of $@ though due to new bugs
	if [[ "$commandLineSwitch" == "-m" ]]; then
		googleMaps "$@"
        	#exit
	elif [[ "$commandLineSwitch" == "-M" ]]; then
        	metadataExtraction "$argumentToPass"
        	#exit
	fi
elif [[ "$commandLineSwitch" == "--help" ]]; then
	  menu_help
elif [ "$#" -ne  2  ]; then
	echo "2 args are needed."
else
	if [[ "$commandLineSwitch" == "-dBa" ]]; then
		Excute_All_Dorkings
	elif [[ "$commandLineSwitch" == "-dBi" ]]; then
		Excute_All_Dorkings
	elif [[ "$commandLineSwitch" == "-dD" ]]; then
		Excute_All_Dorkings
	elif [[ "$commandLineSwitch" == "-dG" ]]; then
		Excute_All_Dorkings
	elif [[ "$commandLineSwitch" == "-n" ]]; then
                dnsCheck "$argumentToPass"
                #exit
	elif [[ "$commandLineSwitch" == "-s" ]]; then
                shodanFunc "$argumentToPass"
                #exit
	elif [[ "$commandLineSwitch" == "-t" ]]; then
                txtFileChecks "$argumentToPass"
                #exit
	elif [[ "$commandLineSwitch" == "-w" ]]; then
                whoIsFunc "$argumentToPass"
                #exit 
	elif [[ "$commandLineSwitch" == "-g" ]]; then 
		bannerGrab "$argumentToPass"
	fi
fi
