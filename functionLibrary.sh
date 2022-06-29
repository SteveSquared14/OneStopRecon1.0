#!/bin/bash
#Function for each module of the tool

#whois - takes a domain and returns any name servers
whoIsFunc(){
	domain=$1
	whois $domain > tempFile.txt

	echo "Would you like to conduction optional name-server enumeration? (Y/N)"
	read response
	if [[ "$response" == "Y" ]]; then
		nameServers="$(cat tempFile.txt | grep -E "Name Server: [a-z]")"
		nameServersArray=($nameServers)
		
		for ns in "${!nameServersArray[@]}";do
			if [[ $(($ns % 3 )) == "2" ]]; then
				echo "==========Summary for "${nameServersArray[ns]}"=========="
				
				nslookup "${nameServersArray[ns]}"
			fi
		done
		echo "============================================="
	elif [[ "$response" == "N" ]]; then
		cat tempFile.txt
		rm tempFile.txt
	fi
}

#robots.txt
robotsTxt(){
	urlPrepend="https://"
	domainToOpen=$1
	urlAppend="/robots.txt/"
	completeURL=$urlPrepend$domainToOpen$urlAppend
	xdg-open $completeURL
}

#exploitDB



#DNS enumeration
#Commands to use - dig, host, nslookup, 
dnsCheck(){
	#run dig command with a parameter of a chosen domain
	dig $1 > tempDigFile.txt
	cat tempDigFile.txt | grep -E 

	#grep output of dig, looking for an ip addrr. Pass that to host command
}

#seperate function nslookup for dns enumeration
#copy code from above

#google maps
googleMaps(){
	urlPrepend="https://google.com/maps/place/"
	placeToOpen=""
	for var in "$@"; do
		if [[ $placeToOpen -eq "" ]]
		then
			placeToOpen=$var
		else
			placeToOpen=$placeToOpen+$var
			shift
		fi
	done
	urlAppend="/"
	completeUrl=$urlPrepend$placeToOpen$urlAppend
	xdg-open $completeUrl
}

#facebook/social media


#metadata extraction


#shodan



#Testing below here
#whoIsFunc $1
#googleMaps $@
#robotsTxt $1
dnsCheck $1
