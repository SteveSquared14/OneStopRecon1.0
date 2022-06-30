#!/bin/bash
#Function for each module of the tool

#whois - takes a domain and returns any name servers
whoIsFunc(){
	domain=$1
	whoIsOutput="$(whois $domain)"
	nameServers="$(echo "$whoIsOutput" | grep -E "Name Server: [a-z]")"

	echo "Name Servers for $domain have been found!"
	echo "Would you also like to conduction optional name-server enumeration? (Y/N)"
	read response
	if [[ "$response" == "Y" ]] || [[ "$response" == "y" ]]; then
		echo "======================= Summary of whois for $domain ======================="
		echo "$whoIsOutput"
		nsLookupFunc $nameServers		

	elif [[ "$response" == "N" ]] || [[ "$response" == "n" ]]; then
		echo "======================= Summary of whois for $domain ======================="
		echo "$whoIsOutput"
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
#Commands to use - dig, host, nslookup
dnsCheck(){
	#run dig command with a parameter of a chosen domain
	#dig $1 > tempDigFile.txt
	echo "======================= Summary of Dig for "$1" ======================="
	dig $1
	ipAddr="$(dig $1 | grep -Eo "[0-9]{1,3}[.][0-9]{1,3}[.][0-9]{1,3}[.][0-9]{1,3}$")"
	
	#grep output of dig, looking for an ip addrr. Pass that to host command
	echo " "
       	echo "==================== Summary of Host for "$ipAddr" ===================="
	host $ipAddr
	
	#name server enumeration - duplicate code atm, need to refine
	nameServers="$(whois $1 | grep -E "Name Server: [a-z]")"
	dnsNameServersArray=($nameServers)
	echo " "
	echo " "
	echo "=================== Summary for nsLookup of Name Servers ==================="
	for ns in "${!dnsNameServersArray[@]}"; do
		if [[ $(($ns % 3 )) == "2" ]];then
			echo "======================== Summary for "${dnsNameServersArray[ns]}" ========================"
			nslookup "${dnsNameServersArray[ns]}"
		fi
	done

}

#seperate function nslookup for dns enumeration
nsLookupFunc(){
	nameServersArray=($@)
		
	for ns in "${!nameServersArray[@]}";do
		if [[ $(($ns % 3 )) == "2" ]]; then
			echo "========== Summary for "${nameServersArray[ns]}" =========="
			
			nslookup "${nameServersArray[ns]}"
		fi
	done
	echo "============================================="
}


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


#metadata extraction - TBC by Mo


#shodan
#url parameter manipulation to open a webpage for whatever the user wants to search for
#open it in a web browser = maybe use xdg-open


#Testing below here
whoIsFunc $1
#googleMaps $@
#robotsTxt $1
#dnsCheck $1
