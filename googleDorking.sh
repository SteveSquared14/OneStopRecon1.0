#!/bin/bash 

#initialising common variables
#mainUrl="https://www.google.com/search?q="
colonHex="%3A"
fileConvention="+filetype%3A"
searchTerm="$2"

#initialise an associative array for different search engine dorking
declare -A searchEnginesArray
searchEnginesArray[-dBa]="https://www.baidu.com/s?wd="
searchEnginesArray[-dBi]="https://www.bing.com/search?q="
searchEnginesArray[-dD]="https://www.duckduckgo.com/?q="
searchEnginesArray[-dG]="https://www.google.com/search?q="

#determine which search engine is to be used dependant on mode selected by user
for key in "${!searchEnginesArray[@]}"; do
	if [[ "$1" == "$key" ]]; then
		mainUrl="${searchEnginesArray[$key]}"
	fi
done


#Functions that process the google dorking
dorking_cache(){
        append="cache" 
        concatUrl=$mainUrl$append$colonHex$searchTerm
        xdg-open $concatUrl
}

dorking_site(){
        append="site"
        concatUrl=$mainUrl$append$colonHex$searchTerm
        xdg-open $concatUrl
}

dorking_inurl(){
        append="inurl" 
        concatUrl=$mainUrl$append$colonHex$searchTerm
        xdg-open $concatUrl
}

dorking_intitle(){
        append="intitle" 
        concatUrl=$mainUrl$append$colonHex$searchTerm
        xdg-open $concatUrl
}

dorking_intext(){
        append="intext"
        concatUrl=$mainUrl$append$colonHex$searchTerm
        xdg-open $concatUrl
}
                                                                                                                                   
                                                                                                                                   
dorking_fileType_PDF(){                                                                                                                                                                                                            
        urlWithTerm=$mainUrl$searchTerm                                                                                           
        concatUrl=$urlWithTerm$fileConvention"pdf"                                                                                                                                                                                       
        xdg-open $concatUrl                                                                                                        
}                                                                                                                                  
                                                                                                                                   
dorking_fileType_PNG(){                                                                                                                                                                                                            
        urlWithTerm=$mainUrl$searchTerm                                                                                           
        concatUrl=$urlWithTerm$fileConvention"png"                                                                                                           
        xdg-open $concatUrl                                                                                                        
}                                                                                                                                  
                                                                                                                                   
dorking_fileType_JPEG(){                                                                                                                                                                                                           
        urlWithTerm=$mainUrl$searchTerm                                                                                           
        concatUrl=$urlWithTerm$fileConvention"jpeg"                                                                                                                                                                                      
        xdg-open $concatUrl                                                                                                        
                                                                                                                                   
}                                                                                                                                  
                                                                                                                                   
dorking_fileType_XML(){                                                                                                                                                                                                            
        urlWithTerm=$mainUrl$searchTerm                                                                                           
        concatUrl=$urlWithTerm$fileConvention"xml"                                                                                                                                                                                        
        xdg-open $concatUrl                                                                                                        
                                                                                                                                   
}                                                                                                                                  
                                                                                                                                   
dorking_fileType_LOG(){                                                                                                                                                                                                           
        urlWithTerm=$mainUrl$searchTerm                                                                                           
        concatUrl=$urlWithTerm$fileConvention"log"                                                                                                                                                                                     
        xdg-open $concatUrl                                                                                                        
                                                                                                                                   
}

dorking_fileType_XLSX(){
	urlWithTerm=$mainUrl$searchTerm
	concatUrl=$urlWithTerm$fileConvention"xlsx"
	xdg-open $concatUrl
}

dorking_fileType_TXT(){
	urlWithTerm=$mainUrl$searchTerm
	concatUrl=$urlWithTerm$fileConvention"txt"
	xdg-open $concatUrl
}


Excute_All_Dorkings(){
	dorking_cache
	dorking_site
        dorking_inurl
        dorking_intitle
        dorking_intext
        dorking_fileType_PDF
        dorking_fileType_PNG
        dorking_fileType_JPEG
        dorking_fileType_XML
        dorking_fileType_LOG
}


#function calling                                                                                                                 
#dorking_cache                                                                                                            
#dorking_site                                                                                                            
#dorking_inurl                                                                                                         
#dorking_intitle                                                                                                         
#dorking_intext                                                                                                          
#dorking_fileType_PDF
#dorking_fileType_PNG
#dorking_fileType_JPEG
#dorking_fileType_XML
#dorking_fileType_LOG
