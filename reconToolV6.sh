#!/bin/bash

PathDir="$(pwd)"
#. $PathDir/functionLibrary.sh
. $PathDir/dorking2.sh
. $PathDir/functionLibrary2.sh

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
        echo -e " -g    | --grabbing banner \t\tGain deatils about a system on a network\t\t\t[Passive]"
        echo -e " -M   | --MetaDataExtractor\t\tExracts data from files\t\t\t\t\t\t\t[Passive]"
        echo -e " -m   | --Google Map Request\t\tOpens google map to inputted location\t\t\t\t\t[Passive]"
        echo -e " -n   | --Name Server Enumeration \tLocating all DNS servers and records for a company\t[Passive/Active]"
        echo -e " -s   | --Shodan  \t\t\tIoT devices check\t\t\t\t\t\t\t[Passive]"
        echo -e " -t   | --Text file recon \t\tChecks for intel in Robots.txt & Security.txt of domain\t\t\t[Passive]"
        echo -e "\t-w   | --Whois \t\t\tWhois URL check\t\t\t\t\t\t\t\t[Passive]"
}

commandLineSwitch=$1
#echo "commandLineSwitch is "$commandLineSwtich""
argumentToPass=$2

#working with array of args as of 6/7/22 - may need to pass array here instead of $@ though due to new bugs

if [[ "$commandLineSwitch" == "--help" ]]; then
          menu_help
elif [ "$#" -lt  2  ]; then
        echo "Incorrect nummber of parameter. Use \"--help\" to display help menu."
else
        #if [[ "$commandLineSwitch" == "-dBa" ]]; then
                #Excute_All_Dorkings
        if [[ "$commandLineSwitch" == "-dB" ]]; then
                Excute_All_Dorkings #Bing
        elif [[ "$commandLineSwitch" == "-dD" ]]; then
                Excute_All_Dorkings #Duckduck go
        elif [[ "$commandLineSwitch" == "-dG" ]]; then
                Excute_All_Dorkings # Google
        elif [[ "$commandLineSwitch" == "-n" ]]; then
                dnsCheck "$argumentToPass" #DNS 
        elif [[ "$commandLineSwitch" == "-s" ]]; then
                shodanFunc "$argumentToPass" #Shodan
        elif [[ "$commandLineSwitch" == "-t" ]]; then
                txtFileChecks "$argumentToPass" #security.txt & robots.txt
        elif [[ "$commandLineSwitch" == "-w" ]]; then
                whoIsFunc "$argumentToPass" #whoIs
        elif [[ "$commandLineSwitch" == "-g" ]]; then 
                bannerGrab "$argumentToPass" #banner grabbing
        elif [[ "$commandLineSwitch" == "-m" ]]; then
                googleMaps "$@" #Google Maps
        elif [[ "$commandLineSwitch" == "-M" ]]; then
                metadataExtraction "$@" # Metadata Extraction
        fi
fi
