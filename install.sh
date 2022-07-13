#!/bin/bash
#Updated permissions
ToolsDirectory=~/ReconTool

sudo apt update

mkdir Findings
WorkingDrive="$(pwd)"
sudo ln -s $WorkingDrive /usr/local/bin/ReconTool

#Install exif for metadata extraction
sudo apt install exif
chmod 755 reconTool.sh

echo "[*] Installation finished!..."
echo " "
echo " "
#Print out of welcome message
echo -e "==============================================================================================================================================================================="
echo -e "" \			         "\t\t\t\t\t\t\t  ___             ____  _              ____                      \n" \
                                         "\t\t\t\t\t\t\t\t / _ \ _ __   ___/ ___|| |_ ___  _ __ |  _ \ ___  ___ ___  _ __  \n" \
                                         "\t\t\t\t\t\t\t\t| | | | '_ \ / _ \___ \| __/ _ \| '_ \| |_) / _ \/ __/ _ \| '_ \ \n" \
                                         "\t\t\t\t\t\t\t\t| |_| | | | |  __/___) | || (_) | |_) |  _ <  __/ (_| (_) | | | |\n" \
                                         "\t\t\t\t\t\t\t\t \___/|_| |_|\___|____/ \__\___/| .__/|_| \_\___|\___\___/|_| |_|\n" \
                                         "\t\t\t\t\t\t\t\t                                |_|                    	   \n" \
""
echo -e "==============================================================================================================================================================================="
echo " "
echo "Welcome to ReconTool! Throughout the design/build phase the aim of the game was try and automate a lot of the common/tedious parts of reconnaissance."
echo " "
echo "The modules below include a mix of bespoke options, along with some others that combine common tools into one place (Such as for DNS Enumeration) and based on section"
echo "4 of the OWASP Testing Methodology"
echo " "
echo "Disclaimer: While a lot of the modules are Passive in nature, there is one that could be considered Semi-Passive/Active so please only use with caution, or" 
echo "necessary authorisation."
echo " "
echo "==================================================================================== Modules: ================================================================================="
echo -e "\n"
       
        echo -e " -b  | --Banner Grabbing \t\tGain details about a system on a network \t\t\t| Takes a domain as an argument\t\t\t\t[Semi-Passive]"
	echo -e " -dB | --Dorking \t\t\tRun popular dorking searches using Bing search engine \t\t| Takes desired search term as an argument\t\t[Passive]"
        echo -e " -dD | --Dorking \t\t\tRun popular dorking searches using Duck Duck Go search engine \t| Takes a desired search term as an argument\t\t[Passive]"
        echo -e " -dG | --Dorking \t\t\tRun popular dorking searches using Google search engine \t| Takes a desried search term as an arugment\t\t[Passive]"
	echo -e " -M  | --MetaDataExtractor\t\tExracts data from files \t\t\t\t\t| File(s) to be analysed to be passed as parameters\t[Passive]"
        echo -e " -m  | --Google Map Request\t\tOpens google map to inputted location \t\t\t\t| Address to be located to be passed as argument\t[Passive]"
        echo -e " -n  | --Name Server Enumeration \tLocating all DNS servers and records for a company \t\t| Takes a domain as an argument\t\t\t\t[Semi-Passive]"
        echo -e " -s  | --Shodan  \t\t\tIoT devices check \t\t\t\t\t\t| Takes desired search term as an arugment\t\t[Passive]"
        echo -e " -t  | --Text file recon \t\tChecks for intel in Robots.txt & Security.txt of domain \t| Takes a domain as an argument\t\t\t\t[Passive]"
        echo -e " -w  | --Whois \t\t\t\tWhois URL check \t\t\t\t\t\t| Takes a domain as an arugment\t\t\t\t[Passive]"

