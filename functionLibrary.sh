#!/bin/bash
#Function for each module of the tool

#whois - takes a domain and returns any name servers
whoIsFunc(){
        domain=$1
        whoIsOutput="$(whois $domain)"
        nameServers="$(echo "$whoIsOutput" | grep -E "Name Server: [a-z]")"
	echo "[*] Executing WhoIs Command..."
	echo "[!] Name Servers for $domain have been found!"
        echo "[!] Would you also like to conduct optional name-server enumeration? (Y/N)"
        read response
        if [[ "$response" == "Y" ]] || [[ "$response" == "y" ]]; then
		
		echo "[*] Executing NSLookUp Command..."
                echo "======================= Summary of whois for $domain ======================="
                echo "$whoIsOutput"
                nsLookupFunc $nameServers

        elif [[ "$response" == "N" ]] || [[ "$response" == "n" ]]; then
                echo "======================= Summary of whois for $domain ======================="
                echo "$whoIsOutput"
        fi
}

#robots.txt & security.txt - needs to be passed a domain
txtFileChecks(){
        urlPrepend="https://"
        domainToOpen=$1

        #robots.txt
        urlAppend="/robots.txt"
        completeUrl=$domainToOpen$urlAppend
	echo "[*] Retrieving response from robots.txt of chosen domain..."
	echo "[*] Retrieving response from security.txt of chosen domain..."
        echo "====================== Summary of robots.txt for "$domainToOpen" ===================="
        wget -q $completeUrl
        cat robots.txt
        echo " "
        echo " "
        rm robots.*
        #security.txt
        urlAppend2="/security.txt"
        completeUrl2=$domainToOpen$urlAppend2
        echo "==================== Summary of security.txt for "$domainToOpen" ===================="
        wget -q $completeUrl2
        cat security.txt
        rm security.*
}

#exploitDB
#scrapped until version 2 of tool in progress

#DNS enumeration
#Commands to use - dig, host, nslookup
dnsCheck(){
        #run dig command with a parameter of a chosen domain
	echo "[*] Executing Dig command on target..."
	echo "[*] Executing Host command on target..."
	echo "[*] Executing NSLookUp command on target..."
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
        argArray=($@)
        for var in "${!argArray[@]}"; do
                if [[ "${argArray[var]}" == *"-"* ]]; then
                        shift
                else
                        if [[ $placeToOpen == "" ]]; then
                                placeToOpen=${argArray[var]}
                        else
                                placeToOpen=$placeToOpen+${argArray[var]}
                                shift
                        fi
                fi
        done
        urlAppend="/"
        completeUrl=$urlPrepend$placeToOpen$urlAppend
	echo "[*] Opening target address in user's preferred brower..."
        xdg-open $completeUrl
}

#facebook/social media
#scrapped until version 2 of tool in progress


#metadata extraction
metadataExtraction(){
arrayFiles=("$@")
for file in "${!arrayFiles[@]}"; do 
        if [ -f "${arrayFiles[file]}" ];
        then
		echo "[*] Performing metadata extraction on "${arrayFiles[file]}"..."
                file_name="${arrayFiles[file]}"
                file_ext="$(echo "$file_name" | grep -Eo "[.][a-z]+")"
                echo "============================== Metadata Extraction for "$file_name" =============================="
               	echo "File Extension: "$file_ext""
		echo "File Name & Description:" "$(file $file_name)"
                echo " "
                echo "SHA512 Hash:" "$(sha512sum  $file_name)"
                echo " "
                echo "Head of Hex Dump:" "$(hexdump $file_name | head)"
                echo " "

                if [ $file_ext == ".png" ] || [ $file_ext == ".jpg" ] || [ $file_ext == ".jpeg" ] || [ $file_ext == ".gif" ] || [ $file_ext == ".tiff" ] || [ $file_ext == ".psd" ];
                then
                        exif $file_name
                        echo " "
                        shift
                else
                        echo "[!] File not compatible for EXIF data extraction - Accepted extensions are \".png\" \".jpg\" \".gif\" \".tiff\" \".psd\""
                        echo " "
                        shift
                fi
        else
                echo "[!] Warning: Only files are compatible with this module!"
        fi
done;
}


#shodan
shodanFunc(){
        mainUrl="https://www.shodan.io/search?query="
        searchParams=""
        for var in "$@"; do
                if [[ $searchParams == "" ]];
                then
                        searchParams=$var
                else
                        searchParams=$searchParams+$var
                        shift
                fi
        done
        completeUrl=$mainUrl$searchParams
	echo "[*] Opening target URL in user's preferred browser..."
        xdg-open $completeUrl
}



#banner grabbing
bannerGrab(){
        searchParam=$1
	echo "[*] Executing wget HTTP banner request..."
	echo "[*] Executing curl HTTP banner request..."
        echo "==================== Summary of wget for "$searchParam" ===================="
        echo " "
        wget -q -S "$searchParam"
        rm index.*
        echo " "
        echo "==================== Summary of curl for "$searchParam" ===================="
        echo " "
        curl -s -I "$searchParam"
}
