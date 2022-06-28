#!/bin/bash
#Function for each module of the tool

#whois - takes a domain and returns any name servers
whoIsFunc(){
	domain=$1
	whois $domain > tempFile.txt

	#Part below here is for optional/further enumeration of named servers
	echo "Would you like to conduction optional name-server enumeration? (Y/N)"
	read response
	if [[ "$response" == "Y" ]]; then
		nameServers="$(cat tempFile.txt | grep -Eo "ns[0-9-]+[.]")"
		nameServersArray=($nameServers)
		for ns in "${nameServersArray[@]}"; do
			#echo "ns is $ns"
			echo "==================Summary for "$ns"======================="
			nslookup $ns
		done

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


#google dorking - TBC by Mo


#DNS enumeration
#Commands to use - dig, host, nslookup, 
#dnsCheck(){
#	
#}

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
whoIsFunc $1
#googleMaps $@
#robotsTxt $1
